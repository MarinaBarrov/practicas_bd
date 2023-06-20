-- Reportes parte I - Repasamos INNER JOIN

-- Realizar una consulta de la facturación de e-market. Incluir la siguiente información:

-- ● Id de la factura -
-- ● fecha de la factura -
-- ● nombre de la empresa de correo -
-- ● nombre del cliente -
-- ● categoría del producto vendido - 
-- ● nombre del producto - 
-- ● precio unitario
-- ● cantidad

SELECT Facturas.FacturaID, Facturas.FechaFactura, Correos.Compania, Clientes.Contacto, Categorias.CategoriaNombre, Productos.ProductoNombre, Productos.PrecioUnitario, FacturaDetalle.Cantidad
FROM Facturas 
INNER JOIN Clientes ON Clientes.ClienteID = Facturas.ClienteID
INNER JOIN FacturaDetalle ON  Facturas.FacturaID = FacturaDetalle.FacturaID
INNER JOIN productos ON FacturaDetalle.ProductoID = Productos.ProductoID
INNER JOIN Categorias ON Categorias.CategoriaID = Productos.CategoriaID
INNER JOIN Correos ON Facturas.EnvioVia = Correos.CorreoID;


-- Reportes parte II - INNER, LEFT Y RIGHT JOIN

-- 1. Listar todas las categorías junto con información de sus productos. Incluir todas
-- las categorías aunque no tengan productos.

SELECT *
FROM productos
RIGHT JOIN Categorias ON Categorias.CategoriaID = Productos.CategoriaID;

-- 2. Listar la información de contacto de los clientes que no hayan comprado nunca
-- en emarket.

SELECT *
FROM Clientes
LEFT JOIN Facturas ON clientes.ClienteID = facturas.ClienteID
WHERE facturas.ClienteID IS NULL;

-- 3. Realizar un listado de productos. Para cada uno indicar su nombre, categoría, y
-- la información de contacto de su proveedor. Tener en cuenta que puede haber
-- productos para los cuales no se indicó quién es el proveedor.

SELECT Productos.ProductoNombre, Categorias.CategoriaNombre, Proveedores.Contacto
FROM Productos
LEFT JOIN Proveedores ON Proveedores.ProveedorID = Productos.ProductoID
INNER JOIN categorias ON Productos.CategoriaID = Categorias.CategoriaID;

-- 4. Para cada categoría listar el promedio del precio unitario de sus productos.

SELECT Categorias.CategoriaNombre, AVG(Productos.PrecioUnitario)
FROM categorias
INNER JOIN Productos ON Productos.CategoriaID = Categorias.CategoriaID
GROUP BY Categorias.CategoriaNombre
ORDER BY Categorias.CategoriaNombre;


-- 5. Para cada cliente, indicar la última factura de compra. Incluir a los clientes que
-- nunca hayan comprado en e-market.

SELECT Clientes.Contacto, MAX(Facturas.FechaFactura)
FROM Clientes
LEFT JOIN Facturas ON Facturas.ClienteID = Clientes.ClienteID
GROUP BY Clientes.Contacto;

-- 6. Todas las facturas tienen una empresa de correo asociada (enviovia). Generar un
-- listado con todas las empresas de correo, y la cantidad de facturas
-- correspondientes. Realizar la consulta utilizando RIGHT JOIN.

SELECT Correos.Compania, COUNT(Facturas.EnvioVia)
FROM facturas
RIGHT JOIN correos ON Facturas.EnvioVia = Correos.CorreoID
GROUP BY Correos.Compania