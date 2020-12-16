# Fábrica de Cervezas

## Ejercicio integrador

**La moda de las cervezas artesanales sigue estando en auge y en este tiempo que está complicado abrir los locales aumentaron los envíos. Unos productores nos pidieron un sistema que facilite la administración de su negocio.**

### Las cervezas
La fábrica trabaja con muchas cervezas diferentes, que se pueden organizar en 3 tipos: Clásica, Lager y Porter, cada una con sus propias características. 

El primer objetivo es calcular los costos de cada cerveza, que se determina por el costo de su ingrediente destacado, el lúpulo, más los costos de elaboración. 

Actualmente la fábrica trabaja con dos variedades de lúpulo: importado y local. El costo del lúpulo para un lote de cualquier tipo de cerveza es de $1000 en el caso del importado, mientras que el de producción local es $800. Se asume que estos valores no van a cambiar, pero debido a las fluctuaciones del mercado es posible que se incorporen nuevas variedades en el futuro y tengan otro precio. 

Los costos de elaboración son:
- Para cualquier cerveza Clásica, depende del tipo de levadura que se usó en el proceso de elaboración, pudiendo ser de fermentación baja o alta.
- Si la levadura es de fermentación baja el costo de elaboración es de $300 por lote, pero si se usa levadura de fermentación alta, el costo de elaboración es un 10% del costo del lúpulo.

_Ejemplo: El costo total de un lote de una cerveza Clásica con lúpulo local y levadura de fermentación alta es de $880._

- Para las Lager se utilizan aditivos, por lo que su costo de elaboración es de $50 por cada gramo de aditivo utilizado.

_Ejemplo: El costo total de un lote de una cerveza Lager con lúpulo importado y 2 grs de aditivos es de $1100._

- Y para una cerveza negra Porter el costo de elaboración es siempre de $450 si la cerveza tiene alto contenido alcohólico, o sea mayor del 8%, o $150 en caso contrario.

_Ejemplo: El costo de producción de un lote de una cerveza Porter con lúpulo importado y 9% de alcohol es de $1450._

**Se pide**
1. Calcular el costo total de cualquier lote de cerveza. 
2. Incorporar una nueva variedad de lúpulo.
3. Hacer una prueba de cada ítem.

### Distribuidores
La empresa cuenta con distribuidores que ejecutan los pedidos que se realicen de lotes de cerveza. Un pedido siempre está compuesto por una determinada cantidad de lotes de la misma cerveza. Además, es necesario conocer la distancia en km a donde se enviará el pedido.

Para calcular el precio del pedido se parte de multiplicar la cantidad de lotes del pedido por el costo de cada lote, más una comisión porcentual que cobra cada distribuidor. Además, los distribuidores tienen promociones por las que pueden otorgar ciertos descuentos.

Los descuentos que se pueden aplicar van a depender del tipo de cerveza:
- En las cervezas Clásicas, el descuento es del 5%.
- En las Lager el descuento es 2% por cada gramo de aditivo, hasta un descuento máximo de 10%. 
- Las Porter nunca dan descuentos.

Cada distribuidor decide en qué circunstancias hace descuentos en base a la promoción que tenga en vigencia, que puede ser:
- Por cantidad: Aplica el descuento cuando la cantidad de lotes del pedido supera cierta cantidad que se indica para cada promo.
- Por cercanía: Aplica el descuento cuando el pedido se encuentra cerca del distribuidor. Esto significa que la distancia de envío es menor a 1 km.

Tener en cuenta que cada distribuidor tiene una sola promoción en vigencia y la puede cambiar en cualquier momento. También hay que contemplar los casos de distribuidores que en algún momento no tengan ninguna promoción vigente.

_Ejemplo: El distribuidor "Los Tres Birreros" da descuentos para pedidos de más de 3 lotes y se queda con una comisión del 5%. Mientras que el distribuidor de "Moe" da descuentos a partir de los 7 lotes y se queda con una comisión del 7%._

Se lleva un prolijo registro de los pedidos pendientes, sabiendo qué distribuidor lo tiene asignado, y cuánto lleva cobrado al momento cada distribuidor. 

**Se pide**
1. Conocer el precio de un pedido para un distribuidor, contemplando los descuentos y promociones descritas.
2. Hacer que un distribuidor concrete todos sus pedidos pendientes.
3. Averiguar el total cobrado por un distribuidor.
4. Saber la cantidad de lotes pendientes que corresponden a una determinada cerveza. 
5. Hacer al menos una prueba de cada punto.

### IBU
Un aspecto que le interesa calcular a la fábrica es la unidad internacional de amargor (IBU), que se calcula en base a sus ingredientes de cada cerveza.

La fórmula para calcular el IBU es
`grs de azúcar * amargor del lúpulo / 2`

El amargor del lúpulo es un coeficiente, que para el lúpulo importado es 2.4 y para el local 1.6. La cantidad de azúcar requerida no tiene por qué ser la misma en todas las cervezas. 

En las cervezas Porter, en caso que tenga alto contenido alcohólico, la fórmula es 
`grs de azúcar * amargor del lúpulo / 2 * (1 + (porcentaje alcohólico - límite para considerarla de alto contenido alcohólico)/100)`

En caso contrario, la fórmula es 
`grs de azúcar * amargor del lúpulo / 2 * 0.97` 

**Se pide:**
1. Se establece una ley por la cual se prohíbe vender cervezas con un IBU superior a un valor dado, por lo que se deben cancelar todos los pedidos pendiente de cervezas con esas características.

### Pedidos compuestos
Se incorpora la capacidad de hacer pedidos compuestos, o sea, poder juntar varios "subpedidos" en uno más grande. 

El precio final del pedido compuesto es el que surge de sumar los precios con los descuentos propios de cada subpedido, en caso que el pedido compuesto aplique a la promoción del distribuidor. Para analizar si corresponde aplicar la promoción, se considera:
- La cantidad de lotes es la suma de las cantidades de los subpedidos. 
- La distancia es la máxima distancia entre los subpedidos.

Si alguno de los subpedidos supera el IBU permitido, se cancela todo el pedido.

Para la cantidad de lotes pendientes de una cerveza, estos pedidos se ignoran.

**Se pide:**

1. Que todo lo anterior siga funcionando, contemplando los nuevos pedido
2. ¿Qué sucede si un pedido compuesto tiene como subpedido a otro pedido compuesto?
3. Justificar qué conceptos facilitaron la realización de este nuevo requerimiento.
