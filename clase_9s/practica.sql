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

