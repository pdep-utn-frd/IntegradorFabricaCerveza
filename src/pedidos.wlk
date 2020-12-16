class Pedido {
	var property cerveza = null
	const property cantidad = 1
	const property distancia = 0

	method costo() = cantidad * cerveza.costo()

	method costoTotal(distribuidor) = self.costo() + self.importeComision(distribuidor) - self.importeDescuento(distribuidor)

	method importeComision(distribuidor) =	self.costo() * distribuidor.comision()
	
	method importeDescuento(distribuidor) =	self.costo() * distribuidor.descuento(self)

	method superaIbuPermitido(ibuMaximo) = cerveza.ibu() < ibuMaximo

}

class PedidoCompuesto inherits Pedido{
	const pedidos = []
	
	method agregarPedido(pedido){
		pedidos.add(pedido)
	}
	
	override method cantidad() = pedidos.sum{pp => pp.cantidad()}
	
	override method distancia() = pedidos.max{pp => pp.distancia()}.distancia()
	
	override method costo() = pedidos.sum{pp => pp.costo()}
	
	override method importeDescuento(distribuidor) = pedidos.sum{pp=>pp.importeDescuento(distribuidor)}
		
	override method superaIbuPermitido(ibuMaximo) = pedidos.any{pp=>pp.superaIbuPermitido(ibuMaximo)} 
}

class Distribuidor {

	var property promocion = sinPromocion
	const pedidosPendientes = []
	var totalCobrado = 0
	var property comision

	//Agregados para los tests
	method totalCobrado() = totalCobrado
	method pedidosPendientes() = pedidosPendientes
	
	method descuento(pedido) = 
			if( promocion.aplicaEn(pedido)) 
				pedido.cerveza().descuento()
			else
				0
			
	method agregarPedido(pedido) {
		pedidosPendientes.add(pedido)
	}

	method entregarPedido(pedido) {
		pedidosPendientes.remove(pedido)
		totalCobrado += pedido.importeComision(self)
	}

	method entregarTodosLosPedidos() {
		pedidosPendientes.forEach{ pp => self.entregarPedido(pp)}
	}

	method cantidadLotesPedidosPendientes(cerveza) =
		pedidosPendientes.count({ pp => pp.cerveza() == cerveza })

	method verificarIbuLegal(ibuMaximo) {
		pedidosPendientes.removeAllSuchThat{ pp => pp.superaIbuPermitido(ibuMaximo)} 
	}

}

class PromocionPorCantidad {

	var property cantidadMinima

	method aplicaEn(pedido) = pedido.cantidad() > cantidadMinima
}

object promocionPorCercania {
	method aplicaEn(pedido) = pedido.distancia() < 1
}

object sinPromocion {
	method aplicaEn(pedido) = false
}


// Si se quiere saber la cantidad de pedidos pendientes de toda la cervecería
object cerveceria {
	const distribuidores = []

	method cantidadPedidosPendientes(cerveza) = distribuidores.sum({ d => d.cantidadPedidosPendientes(cerveza) })
}


