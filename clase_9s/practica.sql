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