-- Datos para la base de datos de la farmacia
-- Insertar roles
INSERT INTO roles (nombre_rol) VALUES ('Administrador');
INSERT INTO roles (nombre_rol) VALUES ('Cajero');

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
VALUES ('Analgésico No Opioides', 'Medicamentos utilizados para aliviar el dolor a moderado y fibre');

INSERT INTO categoria_producto (nombre_categoria_producto, descripcion_categoria_producto)
VALUES ('Analgésico Opioides', 'Medicamentos utilizados para dolores intensos o moderados-graves,actuando sobre 
el sistema nervioso central');

INSERT INTO categoria_producto (nombre_categoria_producto, descripcion_categoria_producto)
VALUES ('Coadyuvante o adyuvante', 'Medicamentos utilizados para reducir el dolor, especialmente el dolor 
neuropático, dolor sever');

INSERT INTO categoria_producto (nombre_categoria_producto, descripcion_categoria_producto)
VALUES ('Antibiótico Betalactámico', 'Inihiben la síntesis de la pared celular bacteriana, lo que lleva a la 
muerte de las bacterias. Son efectivos contra una amplia gama de bacterias, 
incluyendo muchas cepas resistentes a otros antibióticos.');

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
INSERT INTO tipo_recetas (nombre_tipo_receta, descripcion_tipo_receta)
VALUES ('Receta General', 'Receta utilizada para medicamentos de venta libre o con receta, 
sin restricciones especiales.');

INSERT INTO tipo_recetas (nombre_tipo_receta, descripcion_tipo_receta)
VALUES ('Receta Controlada', 'Receta utilizada para medicamentos que requieren un control especial debido a su 
potencial de abuso o efectos secundarios');

INSERT INTO tipo_recetas (nombre_tipo_receta, descripcion_tipo_receta)
VALUES ('Venta Libre', 'Medicamentos que pueden ser adquiridos sin necesidad de receta médica');

-- INSERTAR PRODUCTOS
INSERT INTO productos (codigo_producto, nombre_producto, componente_activo_producto, 
uso_producto, clasificacion_producto, tipo_producto, categoria_producto, 
descripcion_producto, grupo_control, venta_unitaria, presentacion, 
contenido_neto_producto, precio_venta, id_tipo_receta)
VALUES ('7501573900269', 'Quitadol', 'Paracetamol', 'Adultos', 'Genérico', 'Medicamento', 
1, 'Alivio del dolor moderado: de cabeza, denticiones, musculares, cólico menstrual, 
osteoartritis de articulaciones, malestares resfriado común, fiebre', 3, FALSE, 
'Tableta', '750 mg', 20.00, 3);

INSERT INTO productos (codigo_producto, nombre_producto, componente_activo_producto,
uso_producto, clasificacion_producto, tipo_producto, categoria_producto,
descripcion_producto, grupo_control, venta_unitaria, presentacion,
contenido_neto_producto, precio_venta, id_tipo_receta)
VALUES ('7503004908875', 'Acarbosa', 'Acarbosa', 'Adultos', 'Genérico', 'Medicamento',
1, 'Tratamiento de la diabetes mellitus tipo 2, especialmente en pacientes con sobrepeso u obesidad', 
3, FALSE,
'Tableta', '50 mg', 63.00, 3);

INSERT INTO productos (codigo_producto, nombre_producto, componente_activo_producto,
uso_producto, clasificacion_producto, tipo_producto, categoria_producto,
descripcion_producto, grupo_control, venta_unitaria, presentacion,
contenido_neto_producto, precio_venta, id_tipo_receta)
VALUES ('7702018072439', 'Venus Gillete', 'Adultos', 'Patente', 'Higiene', 4, 
'Rastrillo de afeitar para mujeres, con 3 hojas y banda lubricante', 4, TRUE, 
'Rastrillo', '1 pieza', 35.00, 3);

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

-- INSERTAR LOTES DE PRODUCTO
