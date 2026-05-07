-- Datos para la base de datos de la farmacia
-- Insertar roles
INSERT INTO roles (nombre_rol) VALUES ('Administrador');
INSERT INTO roles (nombre_rol) VALUES ('Cajero');

-- inserar formas farmaceuticas
INSERT INTO formas_farmaceuticas (nombre_forma_farmaceutica, descripcion_forma_farmaceutica)
VALUES ('Tableta', 'Forma sólida de medicamento que se administra por vía oral.');

INSERT INTO formas_farmaceuticas (nombre_forma_farmaceutica, descripcion_forma_farmaceutica)
VALUES ('Cápsula', 'Forma sólida de medicamento que se administra por vía oral, con una cubierta gelatinosa.');

INSERT INTO formas_farmaceuticas (nombre_forma_farmaceutica, descripcion_forma_farmaceutica)
VALUES ('Suspensión oral', 'Forma líquida de medicamento que se administra por vía oral, con partículas sólidas suspendidas en un líquido.');

INSERT INTO formas_farmaceuticas (nombre_forma_farmaceutica, descripcion_forma_farmaceutica)
VALUES ('Solución oral', 'Forma líquida de medicamento que se administra por vía oral, con los ingredientes completamente disueltos.');

INSERT INTO formas_farmaceuticas (nombre_forma_farmaceutica, descripcion_forma_farmaceutica)
VALUES ('Jarabe', 'Forma líquida de medicamento que se administra por vía oral, con un sabor dulce y una consistencia más espesa que la solución oral.');

INSERT INTO formas_farmaceuticas (nombre_forma_farmaceutica, descripcion_forma_farmaceutica)
VALUES ('Ungüento', 'Forma semisólida de medicamento que se aplica tópicamentEnte para tratar afecciones de la piel.');

INSERT INTO formas_farmaceuticas (nombre_forma_farmaceutica, descripcion_forma_farmaceutica)
VALUES ('Crema', 'Forma semisólida de medicamento que se aplica tópicamente para tratar afecciones de la piel, con una consistencia más ligera que el ungüento.');

INSERT INTO formas_farmaceuticas (nombre_forma_farmaceutica, descripcion_forma_farmaceutica)
VALUES ('Solución inyectable', 'Forma líquida de medicamento que se administra por vía parenteral, utilizando una aguja y jeringa.');

-- insertar tipo de productos
INSERT INTO tipo_producto (nombre_tipo_producto) VALUES ('Medicamento');
INSERT INTO tipo_producto (nombre_tipo_producto) VALUES ('Cuidado Personal');
INSERT INTO tipo_producto (nombre_tipo_producto) VALUES ('Belleza');
INSERT INTO tipo_producto (nombre_tipo_producto) VALUES ('Curación');
INSERT INTO tipo_producto (nombre_tipo_producto) VALUES ('Dulces');

-- Insertar clasificaciones de productos
INSERT INTO clasificacion_producto (nombre_clasificacion_producto) VALUES ('Genérico');
INSERT INTO clasificacion_producto (nombre_clasificacion_producto) VALUES ('Patente');

-- Insertar productos faltantes
INSERT INTO producto_faltante (nombre_producto_faltante, presentacion_producto_faltante) 
VALUES ('Clamoxin Junior', 'Suspensión oral (125 mg/5 ml)');

INSERT INTO producto_faltante (nombre_producto_faltante, presentacion_producto_faltante)
VALUES ('Cefalexina', 'Cápsulas (250 mg)');

INSERT INTO producto_faltante (nombre_producto_faltante, presentacion_producto_faltante)
VALUES ('Losartan', 'Cápsulas (50 mg)');

INSERT INTO producto_faltante (nombre_producto_faltante, presentacion_producto_faltante)
VALUES ('Chupon para biberon');

INSERT INTO producto_faltante (nombre_producto_faltante, presentacion_producto_faltante)
VALUES ('Agua oxigenada', '125 ml');

-- Para aumentar el contador
INSERT INTO producto_faltante (nombre_producto_faltante, presentacion_producto_faltante)
VALUES ('Paracetamol Infantil', 'Jarabe')
ON DUPLICATE KEY UPDATE veces_solicitado = veces_solicitado + 1;

INSERT INTO producto_faltante (nombre_producto_faltante, presentacion_producto_faltante)
VALUES ('Paracetamol Infantil', 'Jarabe')
ON DUPLICATE KEY UPDATE veces_solicitado = veces_solicitado + 1;

INSERT INTO producto_faltante (nombre_producto_faltante, presentacion_producto_faltante)
VALUES ('Clamoxin Junior', 'Cápsulas (250 mg') 
ON DUPLICATE KEY UPDATE cantidad_solicitada = cantidad_solicitada +1;

INSERT INTO producto_faltante (nombre_producto_faltante, presentacion_producto_faltante)
VALUES ('Clamoxin Junior', 'Cápsulas (250 mg') 
ON DUPLICATE KEY UPDATE cantidad_solicitada = cantidad_solicitada +1;

INSERT INTO producto_faltante (nombre_producto_faltante, presentacion_producto_faltante)
VALUES ('Clamoxin Junior', 'Cápsulas (250 mg') 
ON DUPLICATE KEY UPDATE cantidad_solicitada = cantidad_solicitada +1;

-- Insertar usuarios
INSERT INTO usuarios (numero_de_empleado, nombre_usuario, apellido_paterno_usuario, apellido_materno_usuario, 
contrasenia_usuario, rol_usuario) 
VALUES (010802, 'Nieves', 'Sánchez', 'Salvador', 'admin123', 1);

INSERT INTO usuarios (numero_de_empleado, nombre_usuario, apellido_paterno_usuario, apellido_materno_usuario, 
contrasenia_usuario, rol_usuario)
VALUES (061094, 'Silveria', 'Sánchez', 'Salvador', 'admin123', 1);

INSERT INTO usuarios (numero_de_empleado, nombre_usuario, apellido_paterno_usuario, apellido_materno_usuario, 
contrasenia_usuario, rol_usuario)
VALUES (060190, 'Lidia', 'Sánchez', 'Salvador', 'cajero123', 2);

-- INSERTAR CATEGORIAS DE PRODUCTOS
INSERT INTO categoria_producto (nombre_categoria_producto, descripcion_categoria_producto)
VALUES ('Analgésico', 'Medicamentos utilizados para aliviar el dolor y fiebre');

INSERT INTO categoria_producto (nombre_categoria_producto, descripcion_categoria_producto)
VALUES ('Antibiótico', 'Medicamentos utilizados para tratar infecciones bacterianas, inhibiendo el crecimiento 
de las bacterias o matándolas.');

-- INSERTAR GRUPOS DE CONTROL
INSERT INTO grupo_control (nombre_grupo_control, descripcion_grupo_control)
VALUES ('I', 'Son sustancias con un alto potencial de abuso y adicción, reguladas estrictamente.');

INSERT INTO grupo_control (nombre_grupo_control, descripcion_grupo_control)
VALUES ('II', 'Son medicamentos que actúan sobre el sistema nervioso central, causando dependencia, 
comúnmente utilizados 
para ansiedad o insomnio.');

INSERT INTO grupo_control (nombre_grupo_control, descripcion_grupo_control)
VALUES ('III', 'Medicamentos con menor potencial de adicción que el grupo II, pero que aún requieren control 
médico estricto 
(antidepresivos, estimulantes).');

INSERT INTO grupo_control (nombre_grupo_control, descripcion_grupo_control)
VALUES ('IV', 'Medicamentos con bajo potencial de abuso, pero que aún pueden causar dependencia, medicamentos 
de venta con receta');

-- INSERTAR TIPOS DE RECETAS
INSERT INTO tipo_recetas (nombre_tipo_receta, descripcion_tipo_receta, requiere_receta, requiere_retencion)
VALUES ('Receta General', 'Receta utilizada para medicamentos de venta libre o con receta, 
sin restricciones especiales.', FALSE, FALSE);

INSERT INTO tipo_recetas (nombre_tipo_receta, descripcion_tipo_receta, requiere_receta, requiere_retencion)
VALUES ('Receta Controlada', 'Receta utilizada para medicamentos que requieren un control especial debido a su 
potencial de abuso o efectos secundarios', TRUE, TRUE);

INSERT INTO tipo_recetas (nombre_tipo_receta, descripcion_tipo_receta, requiere_receta, requiere_retencion)
VALUES ('Venta Libre', 'Medicamentos que pueden ser adquiridos sin necesidad de receta médica', FALSE, FALSE);

-- INSETAR RECETAS
INSERT INTO recetas (nombre_paciente, nombre_doctor, direccion_doctor, cedula_profesional_doctor, fecha_receta, archivo_receta, 
observaciones_receta, id_tipo_receta)
VALUES ('Juan Pérez', 'Dr. García', 'Calle 123, Mexico', '123456', '2023-10-01', 'receta1.jpg', 'Paciente con dolor de cabeza', 1);

INSERT INTO recetas (nombre_paciente, nombre_doctor, direccion_doctor, cedula_profesional_doctor, fecha_receta, archivo_receta,
observaciones_receta, id_tipo_receta)
VALUES ('María López', 'Dra. Martínez', 'Avenida 456, Mexico', '654321', '2023-10-02', 'receta2.jpg', 'Paciente con infección respiratoria', 2);

INSERT INTO recetas (nombre_paciente, nombre_doctor, direccion_doctor, cedula_profesional_doctor, fecha_receta, archivo_receta,
observaciones_receta, id_tipo_receta)
VALUES ('Carlos Sánchez', 'Dr. Rodríguez', 'Boulevard 789, Mexico', '789012', '2023-10-03', 'receta3.jpg', 'Paciente con diabetes tipo 2', 1);

-- Insertar proveedores
INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor, correo_proveedor)
VALUES ('Proveedor A', 'Calle 123, Mexico', '555-1234', 'proveedorA@mexico.com');

INSERT INTO proveedores (nombre_proveedor, direccion_proveedor, telefono_proveedor, correo_proveedor)
VALUES ('Proveedor B', 'Avenida 456, Mexico', '555-5678', 'proveedorB@mexico.com');

-- Insertar compras
INSERT INTO compras (id_proveedor, fecha_compra, total_compra)
VALUES (1, '2023-10-01', 500.00);

INSERT INTO compras (id_proveedor, fecha_compra, total_compra)
VALUES (2, '2023-10-02', 750.00);

INSERT INTO compras (id_proveedor, fecha_compra, total_compra)
VALUES (1, '2023-10-03', 300.00);

-- INSERTAR PRODUCTOS
INSERT INTO productos (codigo_producto, nombre_producto, componente_activo_producto, 
uso_producto, unidad_base, id_clasificacion_producto, id_tipo_producto, id_categoria_producto,
descripcion_producto, id_grupo_control, venta_unitaria, 
contenido_neto_producto, id_tipo_receta, id_forma_farmaceutica)
VALUES ('7501573900269', 'Quitadol', 'Paracetamol', 'Adultos', 'Caja', 1, 1, 1,
'Alivio del dolor moderado: de cabeza, denticiones, musculares, cólico menstrual, 
osteoartritis de articulaciones, malestares resfriado común, fiebre', 1, FALSE, 
'10 tabletas', 2, 3);

INSERT INTO productos (codigo_producto, nombre_producto, componente_activo_producto,
uso_producto, unidad_base, id_clasificacion_producto, id_tipo_producto, id_categoria_producto,
descripcion_producto, id_grupo_control, venta_unitaria, 
contenido_neto_producto, id_tipo_receta, id_forma_farmaceutica)
VALUES ('7503004908875', 'Acarbosa', 'Acarbosa', 'Adultos', 'Caja', 2, 1, 1,
'Tratamiento de la diabetes mellitus tipo 2, especialmente en pacientes con sobrepeso u obesidad', 2, FALSE,
'30 tabletas', 2, 2);

INSERT INTO productos (codigo_producto, nombre_producto, componente_activo_producto,
uso_producto, unidad_base, id_clasificacion_producto, id_tipo_producto, id_categoria_producto,
descripcion_producto, id_grupo_control, venta_unitaria, 
contenido_neto_producto, id_tipo_receta, id_forma_farmaceutica)
VALUES ('7702018072439', 'Venus Gillete', 'Venus Gillete', 'Adultos', '1 pieza', 1, 2, 2,
'Rastrillo de afeitar para mujeres, con 3 hojas y banda lubricante', 4, TRUE, 
'1 pieza', 2, 3);

-- INSERTAR LOTES DE PRODUCTO
INSERT INTO lote_producto (id_producto, lote_producto, fecha_caducidad, precio_compra, stock_unidades)
VALUES (1, 'Lote001', '2024-12-31', 15.00, 100);

INSERT INTO lote_producto (id_producto, lote_producto, fecha_caducidad, precio_compra, stock_unidades)
VALUES (2, 'Lote002', '2025-06-30', 50.00, 50);

INSERT INTO lote_producto (id_producto, lote_producto, fecha_caducidad, precio_compra, stock_unidades)
VALUES (3, 'Lote003', '2024-11-30', 25.00, 30);

INSERT INTO lote_producto (id_producto, lote_producto, fecha_caducidad, precio_compra, stock_unidades)
VALUES (1, 'Lote004', '2025-01-31', 14.00, 200);

INSERT INTO lote_producto (id_producto, lote_producto, fecha_caducidad, precio_compra, stock_unidades)
VALUES (2, 'Lote005', '2025-07-31', 48.00, 80);

INSERT INTO lote_producto (id_producto, lote_producto, fecha_caducidad, precio_compra, stock_unidades)
VALUES (3, 'Lote006', '2024-12-31', 22.00, 40);

-- INSERTAR DETALLE COMPRA
INSERT INTO detalle_compra (id_compra, id_lote, cantidad, precio_unitario)
VALUES (1, 1, 100, 15.00);

INSERT INTO detalle_compra (id_compra, id_lote, cantidad, precio_unitario)
VALUES (2, 2, 50, 50.00);

INSERT INTO detalle_compra (id_compra, id_lote, cantidad, precio_unitario)
VALUES (3, 3, 30, 25.00);

INSERT INTO detalle_compra (id_compra, id_lote, cantidad, precio_unitario)
VALUES (1, 4, 200, 14.00);

INSERT INTO detalle_compra (id_compra, id_lote, cantidad, precio_unitario)
VALUES (2, 5, 80, 48.00);

INSERT INTO detalle_compra (id_compra, id_lote, cantidad, precio_unitario)
VALUES (3, 6, 40, 22.00);

-- INSERTAR UNIDADES DE PRODUCTO
INSERT INTO unidad_producto (id_producto, unidad_producto, 
cantidad_unidad_producto, precio_unidad_producto)
VALUES (1, 'Caja', 10, 2.00);

INSERT INTO unidad_producto (id_producto, unidad_producto,
cantidad_unidad_producto, precio_unidad_producto)
VALUES (1, 'Tira', 1, 20.00);

INSERT INTO unidad_producto (id_producto, unidad_producto,
cantidad_unidad_producto, precio_unidad_producto)
VALUES (2, 'Caja', 30, 2.10);

INSERT INTO unidad_producto (id_producto, unidad_producto,
cantidad_unidad_producto, precio_unidad_producto)
VALUES (2, 'Tira', 1, 63.00);

INSERT INTO unidad_producto (id_producto, unidad_producto,
cantidad_unidad_producto, precio_unidad_producto)
VALUES (3, 'Unidad', 1, 35.00);

-- Insertar movimientos de inventario
INSERT INTO movimientos_inventario (id_producto, id_lote, tipo_movimiento, cantidad, fecha)
VALUES (1, 1, 'Entrada', 100, '2023-10-01');

INSERT INTO movimientos_inventario (id_producto, id_lote, tipo_movimiento, cantidad, fecha)
VALUES (2, 2, 'Entrada', 50, '2023-10-02');

INSERT INTO movimientos_inventario (id_producto, id_lote, tipo_movimiento, cantidad, fecha)
VALUES (3, 3, 'Entrada', 30, '2023-10-03');

INSERT INTO movimientos_inventario (id_producto, id_lote, tipo_movimiento, cantidad, fecha)
VALUES (1, 4, 'Entrada', 200, '2023-10-04');

INSERT INTO movimientos_inventario (id_producto, id_lote, tipo_movimiento, cantidad, fecha)
VALUES (2, 5, 'Entrada', 80, '2023-10-05');

INSERT INTO movimientos_inventario (id_producto, id_lote, tipo_movimiento, cantidad, fecha)
VALUES (3, 6, 'Entrada', 40, '2023-10-06');

-- insertar ventas
INSERT INTO ventas (id_usuario, fecha_venta, total_venta)
VALUES (1, '2023-10-10', 100.00);

INSERT INTO ventas (id_usuario, fecha_venta, total_venta)
VALUES (2, '2023-10-11', 150.00);

INSERT INTO ventas (id_usuario, fecha_venta, total_venta)
VALUES (3, '2023-10-12', 200.00);

-- Insertar detalle de ventas
INSERT INTO detalle_venta (id_venta, id_lote, id_unidad_producto, cantidad, precio_unitario, id_receta)
VALUES (1, 1, 1, 2, 20.00, 1);

INSERT INTO detalle_venta (id_venta, id_lote, id_unidad_producto, cantidad, precio_unitario, id_receta)
VALUES (2, 2, 3, 1, 63.00, 2);

INSERT INTO detalle_venta (id_venta, id_lote, id_unidad_producto, cantidad, precio_unitario, id_receta)
VALUES (3, 3, 5, 1, 35.00, 3);

-- INSERTAR PROMOCIONES
INSERT INTO promociones (id_producto, porcentaje_descuento, fecha_inicio, fecha_fin)
VALUES (1, 10.00, '2023-10-15', '2023-10-31');

INSERT INTO promociones (id_producto, porcentaje_descuento, fecha_inicio, fecha_fin)
VALUES (2, 15.00, '2023-10-20', '2023-11-05');

INSERT INTO promociones (id_producto, porcentaje_descuento, fecha_inicio, fecha_fin)
VALUES (3, 20.00, '2023-10-25', '2023-11-10');

-- INSERTAR TIPO DE ALETA
INSERT INTO tipo_alerta (nombre_tipo_alerta) VALUES ('Stock Bajo');
INSERT INTO tipo_alerta (nombre_tipo_alerta) VALUES ('Producto Próximo a Caducar');
INSERT INTO tipo_alerta (nombre_tipo_alerta) VALUES ('Producto Faltante');

-- insertar alertas
INSERT INTO alertas (id_tipo_alerta, mensaje_alerta, id_producto, fecha_alerta, leida)
VALUES (1, 'El producto Quitadol tiene un stock bajo. Solo quedan 5 unidades disponibles.', 1, '2023-10-20 10:00:00', FALSE);

INSERT INTO alertas (id_tipo_alerta, mensaje_alerta, id_producto, fecha_alerta, leida)
VALUES (2, 'El producto Acarbosa está próximo a caducar. Fecha de caducidad: 2024-06-30.', 2, '2023-10-21 11:00:00', FALSE);

INSERT INTO alertas (id_tipo_alerta, mensaje_alerta, id_producto, fecha_alerta, leida)
VALUES (3, 'El producto Venus Gillete está faltante. No hay unidades disponibles en stock.', 3, '2023-10-22 12:00:00', FALSE);