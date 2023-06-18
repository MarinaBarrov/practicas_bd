-- -- Clientes

-- 1) ¿Cuántos clientes existen?

SELECT COUNT(clienteid)
FROM clientes;

-- 2) ¿Cuántos clientes hay por ciudad?

SELECT ciudad, COUNT(ciudad) AS clientes
FROM clientes
GROUP BY ciudad;

-- Facturas

-- 1) ¿Cuál es el total de transporte?

SELECT SUM(transporte)
FROM facturas;

-- 2) ¿Cuál es el total de transporte por EnvioVia (empresa de envío)?

SELECT SUM(enviovia)
FROM facturas;

-- 3) Calcular la cantidad de facturas por cliente. Ordenar descendentemente por
-- cantidad de facturas.

SELECT clienteId, count(facturaID) 
FROM facturas
GROUP BY clienteId
ORDER BY count(facturaID) desc;

-- 4) Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.

SELECT clienteId, count(facturaID)
FROM facturas
GROUP BY clienteId
ORDER BY clienteID
LIMIT 5;

-- 5) ¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?

SELECT paisEnvio, COUNT(paisEnvio)
FROM facturas
GROUP BY paisEnvio ;



-- 6) Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado
-- realizó más operaciones de ventas?

SELECT empleadoID, count(empleadoID) AS "VENDEDOR DEL MES"
FROM facturas
GROUP BY empleadoID;

-- Factura detalle

-- 1) ¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?

SELECT productoId, count(productoid) AS "cantidad de ventas por producto"
FROM facturaDetalle
GROUP BY productoID;

-- 2) ¿Cuál es el total facturado? Considerar que el total facturado es la suma de
-- cantidad por precio unitario.

SELECT facturaID, sum(precioUnitario * cantidad) 
FROM facturaDetalle
GROUP BY facturaID;

-- 3) ¿Cuál es el total facturado para los productos ID entre 30 y 50?

SELECT productoID, facturaID, sum(precioUnitario * cantidad)
FROM FacturaDetalle
WHERE productoID BETWEEN 30 AND 50
GROUP BY productoID, FacturaID;

-- 4) ¿Cuál es el precio unitario promedio de cada producto?

SELECT productoID, AVG(precioUnitario)
FROM FacturaDetalle
GROUP BY productoID;

-- 5) ¿Cuál es el precio unitario máximo?

SELECT productoID, MAX(precioUnitario)
FROM FacturaDetalle
GROUP BY productoID;