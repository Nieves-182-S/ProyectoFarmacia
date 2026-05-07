-- Consultas para la base de datos de la farmacia
-- Consulta con o sin JOIN y filtros para la tabla roles
-- ########################################################################################################################
SELECT * FROM roles; -- mostrar la lista de roles

-- ########################################################################################################################
-- Consulta para mostrar las formas farmaceuticas disponibles
SELECT * FROM formas_farmaceuticas;

-- Buscar por tipo de forma farmacéutica
SELECT * FROM formas_farmaceuticas 
WHERE nombre_forma_farmaceutica 
LIKE '%tableta%'; -- mostrar solo las formas famacéuticas que tiene tableta

-- #########################################################################################################################
-- Consulta para mostrar tipo de productos
SELECT * FROM tipo_producto;

-- #########################################################################################################################
-- consulta para mostrar clasificacion de productos
SELECT * FROM clasificacion_producto;

-- ##########################################################################################################################
-- Consulta y filtros para la tabla de productos faltantes
SELECT * FROM productos_faltante;
-- Filtros
-- Mostrar los productos que no han sido solicitados 
SELECT * FROM producto_faltante WHERE solicitado = FALSE;
-- Mostrar los productos que han sido solicitados
SELECT * FROM producto_faltante WHERE solicitado = TRUE;
-- Buscar producto faltante
SELECT * FROM producto_faltante 
WHERE nombre_producto_faltante 
LIKE '%paracetamol%';
-- Marcar un producto como solicitado
UPDATE producto_faltante SET solicitado = TRUE WHERE id_producto_faltante = 1;

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

-- ##########################################################################################################################
-- consultas y filtros para la tabla de usuarios
SELECT * FROM usuarios; -- mostrar la lista de usuarios
-- Filtros para mostrar usuarios por rol
SELECT * FROM usuarios WHERE rol_usuario = 1; -- mostrar solo los administradores
SELECT * FROM usuarios WHERE rol_usuario = 2; -- mostrar solo los cajeros

-- Buscar usuario por nombre
SELECT * FROM usuarios WHERE nombre_usuario LIKE '%Nieves%';

-- Actualizar el rol de un usuario
UPDATE usuarios SET rol_usuario = 1 WHERE nombre_usuario = 'Lidia';

-- Concatenar el nombre completo del usuario
SELECT 
    CONCAT(nombre_usuario, ' ', apellido_paterno_usuario, ' ', apellido_materno_usuario) 
AS nombre_completo FROM usuarios;
-- Concatenar el numero de empleado con el nombre completo del usuario
SELECT 
    CONCAT(numero_de_empleado, ':', nombre_usuario, ' ', apellido_paterno_usuario, ' ', apellido_materno_usuario) 
AS datos_usuario FROM usuarios;

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
-- concatenar el nombre del proveedor con su número de teléfono
SELECT 
    CONCAT(nombre_proveedor, ': ', telefono_proveedor) 
AS telefono_proveedor FROM proveedores;
-- ###########################################################################################################################
-- Consulta y filtros para la tabla de compras
SELECT * FROM compras;

-- ###########################################################################################################################
-- Consulta y filtros para la tabla de productos
SELECT * FROM productos;

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



-- ###########################################################################################################################
-- Consulta y filtros para la tabla de lotes de productos
SELECT * FROM lote_producto;
-- concatenar el número de lote con la fecha de vencimiento
SELECT 
    CONCAT(lote_producto, ': ', fecha_caducidad)
AS vencimiento_de_lote FROM lote_producto;

-- ###########################################################################################################################
-- Consulta y filtros para la tabla de detalle de compras
SELECT * FROM detalle_compra;

-- ###########################################################################################################################
-- Consulta y filtros para la tabla de unidades de producto
SELECT * FROM unidad_producto;
-- concatenar la unidad de producto, cantidad y precio unitario
SELECT 
    CONCAT(unidad_producto, ': ', cantidad_unidad_producto, ' esta en $', precio_unidad_producto, ' c/u')
AS informacion_unidad FROM unidad_producto;

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
