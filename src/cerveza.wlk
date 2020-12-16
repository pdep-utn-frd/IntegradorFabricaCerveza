class Cerveza {

	var property lupulo
	var property azucar = 0

	method costo() {
		return lupulo.costo() + self.costoElaboracion()
	}

	method costoElaboracion()

	method ibu() {
		return azucar * (lupulo.amargor() / 2)
	}

}

class Clasica inherits Cerveza {

	const levadura

	override method costoElaboracion() {
		return levadura.costo(self.lupulo())
	}

	method descuento() = 0.05

}

class Lager inherits Cerveza {
	const aditivos

	override method costoElaboracion() = aditivos * 50
	method descuento() = (aditivos * 0.02).min(0.1)
}

class Porter inherits Cerveza {
	const graduacion

	override method costoElaboracion() = if (self.altaGraduacion()) 450 else 150
	method altaGraduacion() = graduacion > 8

	override method ibu() = super() * if (self.altaGraduacion()) 1 + (graduacion - 8) * 0.01 else 0.97
}

class Lupulo{
	var property costo
	var property amargor
}

const lupuloLocal = new Lupulo(costo = 800, amargor = 1.6)
const lupuloImportado = new Lupulo(costo = 1000, amargor = 2.4)
// const otroLupulo = new Lupulo(...)
	
object levaduraFermentacionAlta {
	method costo(lupulo) = lupulo.costo() * 0.1
}

object levaduraFermentacionBaja {
	method costo(lupulo) = 300
}