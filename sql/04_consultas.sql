-- Consultas para la base de datos de la farmacia
-- Consulta con o sin JOIN y filtros para la tabla roles

SELECT * FROM roles; -- mostrar la lista de roles

-- Consulta y filtros para la tabla de productos faltantes

SELECT * FROM productos_faltante;

-- consultas y filtros para la tabla de usuarios
SELECT * FROM usuarios; -- mostrar la lista de usuarios

SELECT * FROM usuarios WHERE rol_usuario = 1; -- mostrar solo los administradores
SELECT * FROM usuarios WHERE rol_usuario = 2; -- mostrar solo los cajeros

-- Consulta y filtros para la tabla categorias
SELECT * FROM categoria_producto;

-- Consulta y filtros para la tabla de grupos de control
SELECT * FROM grupo_control;

-- Consulta y filtros para la tabla de productos
SELECT * FROM productos;

-- Consulta y filtros para la tabla de unidades de producto
SELECT * FROM unidad_producto;

-- Consulta y filtros para la tabla de lotes de productos
SELECT * FROM lote_producto;

-- Consulta y filtros para la tabla de ventas
SELECT * FROM ventas;

-- Consulta y filtros para la tabla de detalle de ventas
SELECT * FROM detalle_venta;

-- Consulta y filtros para la tabla de proveedores
SELECT * FROM proveedores;

-- Consulta y filtros para la tabla de compras
SELECT * FROM compras;

-- Consulta y filtros para la tabla de detalle de compras
SELECT * FROM detalle_compra;

-- Consulta y filtros para promociones
SELECT * FROM promociones;

--Consulta y filtros para la tabla de alertas
SELECT * FROM alertas;