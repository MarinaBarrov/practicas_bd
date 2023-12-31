-- Categorías y productos

-- 1. Queremos tener un listado de todas las categorías.

SELECT * FROM categorias;

-- 2. Cómo las categorías no tienen imágenes, solamente interesa obtener un
-- listado de CategoriaNombre y Descripcion.

SELECT categoriaNombre, descripcion
FROM Categorias;

-- 3. Obtener un listado de los productos.

SELECT * FROM Productos;

-- 4. ¿Existen productos discontinuados? (Discontinuado = 1).
-- nopi
-- 5. Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son
-- los que nos provee?

SELECT productoNombre, proveedorId 
FROM productos
WHERE proveedorId = "8";

-- 6. Queremos conocer todos los productos cuyo precio unitario se encuentre
-- entre 10 y 22.

SELECT * FROM productos 
WHERE precioUnitario BETWEEN 10 AND 22
ORDER BY precioUnitario DESC;

-- 7. Se define que un producto hay que solicitarlo al proveedor si sus unidades
-- en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?

SELECT *
FROM Productos
WHERE UnidadesStock < NivelReorden;

-- 8. Se quiere conocer todos los productos del listado anterior, pero que
-- unidades pedidas sea igual a cero.

SELECT *
FROM Productos
WHERE UnidadesStock < NivelReorden
AND UnidadesPedidas = 0;

-- Clientes

-- 1. Obtener un listado de todos los clientes con Contacto, Compania, Título,
-- País. Ordenar el listado por País.

SELECT contacto, Compania, Titulo, Pais
FROM Clientes
ORDER BY pais;

-- 2. Queremos conocer a todos los clientes que tengan un título “Owner”.

SELECT *
FROM clientes
WHERE titulo = "owner";

-- 3. El operador telefónico que atendió a un cliente no recuerda su nombre.
-- Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con
-- todos los contactos que inician con la letra “C”?

SELECT contacto
FROM clientes 
WHERE contacto like "c%"

-- Facturas

-- 1. Obtener un listado de todas las facturas, ordenado por fecha de factura
-- ascendente.

SELECT *
FROM facturas
ORDER BY FechaFactura ASC;

-- 2. Ahora se requiere un listado de las facturas con el país de envío “USA” y
-- que su correo (EnvioVia) sea distinto de 3.

SELECT *
FROM Facturas
WHERE paisEnvio = "USA"
AND EnvioVia != 3;

-- 3. ¿El cliente 'GOURL' realizó algún pedido?
-- sipi

SELECT ClienteId, count(*) as numero_pedidos
FROM facturas
WHERE ClienteId = "GOURL";

-- 4. Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.

SELECT *
FROM facturas
WHERE EmpleadoId IN (2, 3, 5, 8, 9)
ORDER BY EmpleadoId ASC

-- Productos

-- 1. Obtener el listado de todos los productos ordenados
-- descendentemente por precio unitario.

SELECT *
FROM productos
ORDER BY precioUnitario DESC;

-- 2. Obtener el listado de top 5 de productos cuyo precio unitario es
-- el más caro.

SELECT *
FROM productos 
ORDER BY precioUnitario DESC 
LIMIT 5;

-- 3. Obtener un top 10 de los productos con más unidades en stock.

SELECT *
FROM productos 
ORDER BY UnidadesStock DESC
LIMIT 10;


-- FacturaDetalle

-- 1. Obtener un listado de FacturaID, Producto, Cantidad.

SELECT facturaId,productoId, cantidad
FROM FacturaDetalle;

-- 2. Ordenar el listado anterior por cantidad descendentemente.

SELECT facturaId,productoId, cantidad
FROM FacturaDetalle
ORDER BY cantidad DESC;

-- 3. Filtrar el listado solo para aquellos productos donde la cantidad
-- se encuentre entre 50 y 100.

SELECT facturaId,productoId, cantidad
FROM FacturaDetalle
WHERE cantidad BETWEEN 50 AND 100;

-- 4. En otro listado nuevo, obtener un listado con los siguientes
-- nombres de columnas: NroFactura (FacturaID), Producto
-- (ProductoID), Total (PrecioUnitario*Cantidad).

SELECT FacturaId, ProductoId, precioUnitario * Cantidad
FROM FacturaDetalle