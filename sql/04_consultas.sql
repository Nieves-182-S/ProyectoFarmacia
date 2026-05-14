-- Consultas para la base de datos de la farmacia
-- Consultas basicas para mostrar los datos de cada tabla.
-- ########################################################################################################################
SELECT * FROM roles; -- mostrar la lista de roles

-- ########################################################################################################################
-- Consulta para mostrar las formas farmaceuticas disponibles
SELECT * FROM formas_farmaceuticas;

-- #########################################################################################################################
-- Consulta para mostrar tipo de productos
SELECT * FROM tipo_producto;

-- #########################################################################################################################
-- consulta para mostrar clasificacion de productos
SELECT * FROM clasificacion_producto;

-- ##########################################################################################################################
-- Consulta y filtros para la tabla de productos faltantes
SELECT * FROM productos_faltante;

-- ##########################################################################################################################
-- consultas y filtros para la tabla de usuarios
SELECT * FROM usuarios; -- mostrar la lista de usuarios

-- ##########################################################################################################################
-- Consulta y filtros para la tabla categorias
SELECT * FROM categoria_producto;

-- ##########################################################################################################################
-- Consulta y filtros para la tabla de grupos de control
SELECT * FROM grupo_control;

-- ###########################################################################################################################
-- Consulta para tipo recetas
SELECT * FROM tipo_receta;

-- ###########################################################################################################################
-- Consulta par recetas
SELECT * FROM recetas;

-- ###########################################################################################################################
-- Consulta y filtros para la tabla de proveedores
SELECT * FROM proveedores;

-- ###########################################################################################################################
-- Consulta y filtros para la tabla de compras
SELECT * FROM compras;

-- ###########################################################################################################################
-- Consulta y filtros para la tabla de productos
SELECT * FROM productos;

-- ###########################################################################################################################
-- Consulta y filtros para la tabla de lotes de productos
SELECT * FROM lote_producto;

-- ###########################################################################################################################
-- Consulta y filtros para la tabla de detalle de compras
SELECT * FROM detalle_compra;

-- ###########################################################################################################################
-- Consulta y filtros para la tabla de unidades de producto
SELECT * FROM unidad_producto;

-- ###########################################################################################################################
-- Consulta para movimientos de inventario
SELECT * FROM movimientos_inventario;

-- ###########################################################################################################################
-- Consulta y filtros para la tabla de ventas
SELECT * FROM ventas;

-- ###########################################################################################################################
-- Consulta y filtros para la tabla de detalle de ventas
SELECT * FROM detalle_venta;

-- ###########################################################################################################################
-- Consulta y filtros para promociones
SELECT * FROM promociones;

-- ###########################################################################################################################
-- Consulta para tipo alertas
SELECT * FROM tipo_alerta;

-- ###########################################################################################################################
-- Consulta y filtros para la tabla de alertas
SELECT * FROM alertas;

-- ###########################################################################################################################
-- ###########################################################################################################################

-- Subconsultas de todas las tablas.
-- Subconsulta productos mas vendidos.
SELECT nombre_producto
FROM productos
WHERE id_producto = (
SELECT id_producto
FROM lote_producto
WHERE id_lote = (
    SELECT id_lote
    FROM detalle_venta
    GROUP BY id_lote
    ORDER BY SUM(cantidad) DESC
    LIMIT 1
    )
);

-- Subconsulta de productos con stock cero
SELECT id_producto, stock_unidades
FROM lote_producto
WHERE stock_unidades < (SELECT AVG(stock_unidades) FROM lote_producto);

-- subconsulta para mostrar los pruductos en cero con su nombre
SELECT 
    nombre_producto
FROM productos
WHERE id_producto IN (
    SELECT id_producto 
FROM lote_producto 
WHERE stock_unidades = 0
);

-- Subconsulta para mostrar los productos que pronto van a caducar
SELECT nombre_producto
FROM productos
WHERE id_producto IN (
SELECT id_producto
FROM lote_producto
WHERE fecha_caducidad 
BETWEEN CURDATE() -- fecha actual
AND DATE_ADD(CURDATE(), INTERVAL 2 MONTH) -- intervalo de 2 meses para mostrar los productos que pronto van a caducar
);

-- Subconsulta para mostrar productos que no se han vendido
SELECT nombre_producto
FROM productos
WHERE id_producto NOT IN (
SELECT id_producto
FROM lote_producto
WHERE id_lote IN (
    SELECT id_lote
    FROM detalle_venta
    )
);

-- Subconsulta para mostrar los productos que tienen promociones
SELECT nombre_producto
FROM productos
WHERE id_producto IN (
    SELECT id_producto FROM promociones
);

-- Subconsulta para mostrar  productos que requieren receta
SELECT nombre_producto
FROM productos
WHERE id_tipo_receta IN (
SELECT id_tipo_receta
FROM tipo_recetas
WHERE requiere_receta = TRUE
);

-- subconsulta de usuario que hizo más ventas
SELECT nombre_usuario
FROM usuarios
WHERE id_usuario = (
SELECT id_usuario
FROM ventas
GROUP BY id_usuario
ORDER BY COUNT(*) DESC
LIMIT 1
);

-- subconsulta de alertas no leidas
SELECT *
FROM alertas
WHERE id_alerta IN (
SELECT id_alerta
FROM alertas
WHERE leida = FALSE
);

-- ############################################################################################################################
-- ############################################################################################################################

-- Buscar por tipo de forma farmacéutica
SELECT * FROM formas_farmaceuticas 
WHERE nombre_forma_farmaceutica 
LIKE '%tableta%'; -- mostrar solo las formas famacéuticas que tiene tableta

-- Filtros
-- Mostrar los productos que no han sido solicitados 
SELECT * FROM producto_faltante WHERE solicitado = FALSE;
-- Mostrar los productos que han sido solicitados
SELECT * FROM producto_faltante WHERE solicitado = TRUE;
-- Buscar producto faltante
SELECT * FROM producto_faltante 
WHERE nombre_producto_faltante 
LIKE '%paracetamol%';

-- consulta concatenando el nombre del producto faltante con si está solicitado o no
SELECT 
    CONCAT(nombre_producto_faltante, ': ', 
    IF(solicitado, 'Solicitado', 'No solicitado')) 
    AS producto_estado
FROM producto_faltante;

-- ver los productos que mas han solicitado y no hay
SELECT 
    nombre_producto_faltante, 
    cantidad_solicitada, 
    fecha_registro 
FROM producto_faltante
ORDER BY cantidad_solicitada DESC;

-- Filtros para mostrar usuarios por rol
SELECT * FROM usuarios WHERE rol_usuario = 1; -- mostrar solo los administradores
SELECT * FROM usuarios WHERE rol_usuario = 2; -- mostrar solo los cajeros

-- Buscar usuario por nombre
SELECT * FROM usuarios WHERE nombre_usuario LIKE '%Nieves%';

-- Concatenar el nombre completo del usuario
SELECT 
    CONCAT(nombre_usuario, ' ', apellido_paterno_usuario, ' ', apellido_materno_usuario) 
AS nombre_completo FROM usuarios;
-- Concatenar el numero de empleado con el nombre completo del usuario
SELECT 
    CONCAT(numero_de_empleado, ':', nombre_usuario, ' ', apellido_paterno_usuario, ' ', apellido_materno_usuario) 
AS datos_usuario FROM usuarios;

-- concatenar el nombre del proveedor con su número de teléfono
SELECT 
    CONCAT(nombre_proveedor, ': ', telefono_proveedor) 
AS telefono_proveedor FROM proveedores;

-- Buscar productos por nombre
SELECT * FROM productos
WHERE nombre_producto LIKE '%quita%';

SELECT * FROM productos
WHERE nombre_producto LIKE '%gillete%';

-- Buscar productos de acuerdo a lo que sirve
SELECT * FROM productos
WHERE nombre_producto LIKE '%cabeza%'
OR componente_activo_producto LIKE '%cabeza%'
OR descripcion_producto LIKE '%cabeza%';

-- concatenar el número de lote con la fecha de vencimiento
SELECT 
    CONCAT(lote_producto, ': ', fecha_caducidad)
AS vencimiento_de_lote FROM lote_producto;

-- concatenar la unidad de producto, cantidad y precio unitario
SELECT 
    CONCAT(unidad_producto, ': ', cantidad_unidad_producto, ' esta en $', precio_unidad_producto, ' c/u')
AS informacion_unidad FROM unidad_producto;

-- concatenar el tipo de movimiento con la cantidad y fecha
SELECT 
    CONCAT(tipo_movimiento, ': ', cantidad, ' productos el ', fecha)
    AS informacion_de_movimiento FROM movimientos_inventario;

-- concatenar fecha de inicio y fecha de fin de la promoción con el porcentaje de descuento
SELECT 
    CONCAT(porcentaje_descuento, '% de descuento', ': ', 'Promoción del ', fecha_inicio, ' al ', fecha_fin) 
AS informacion_promocion FROM promociones;

-- concatenar el mensaje de la alerta con la fecha
SELECT 
    CONCAT(mensaje_alerta, ': ', 'Alerta del ', fecha_alerta)
    AS informacion_alerta FROM alertas;

-- consultas, filtros, joins y subconsultas de combinacion de tablas
-- Consulta para mostrar el nombre del producto, componente activo del producto, su categoría, 
-- su forma farmacéutica y precio unitario
SELECT
    producto.nombre_producto,
    producto.componente_activo_producto,
    categoria.nombre_categoria_producto,
    forma.nombre_forma_farmaceutica,
    unidad.unidad_producto,
    unidad.precio_unidad_producto

FROM productos AS producto 

JOIN categoria_producto AS categoria ON producto.id_categoria_producto = categoria.id_categoria_producto
JOIN formas_farmaceuticas AS forma ON producto.id_forma_farmaceutica = forma.id_forma_farmaceutica
JOIN unidad_producto AS unidad ON producto.id_producto = unidad.id_producto;

-- Consulta para mostrar el nombre del producto, su cantidad en unidades, su precio unitario y el total de la venta
SELECT
    producto.nombre_producto,
    producto.componente_activo_producto,
    producto.contenido_neto_producto,
    forma.nombre_forma_farmaceutica,
    unidad.unidad_producto,
    detalle.cantidad,
    detalle.precio_unitario,
    (detalle.cantidad * detalle.precio_unitario) AS total_venta
FROM productos AS producto
JOIN formas_farmaceuticas AS forma ON producto.id_forma_farmaceutica = forma.id_forma_farmaceutica
JOIN unidad_producto AS unidad ON producto.id_producto = unidad.id_producto
JOIN detalle_venta AS detalle ON unidad.id_unidad_producto = detalle.id_unidad_producto
JOIN ventas AS venta ON detalle.id_venta = venta.id_venta;

-- Consulta para mostrar el nombre del producto, su cantidad en unidades, su precio unitario y el total de la compra así como el de venta y ganancia
