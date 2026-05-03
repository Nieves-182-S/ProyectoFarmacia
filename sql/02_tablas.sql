/*Existen dos tipos de usuarios, el administrador y los cajeros*/
create table roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(20) NOT NULL -- administrador, cajero
);

-- Esta tabla es para registrar los productos que faltan en la farmacia, para que el 
-- administrador pueda solicitarlo al proveedor
CREATE TABLE producto_faltante (
    id_producto_faltante INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto_faltante VARCHAR(100) NOT NULL, -- Nombre comercial o el componente del medicamento
    presentacion_producto_faltante VARCHAR(50), -- caja, frasco, tubo
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha en la que se registro el producto faltante
    solicitado BOOLEAN DEFAULT FALSE  -- Si el producto faltante ya fue solicitado al proveedor o no
);

-- Tabla de usuarios, para registrar a los empleados de la farmacia, tanto administradores
-- como cajeros, para que puedan iniciar sesión en el sistema.
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT, -- identificador del usuario
    numero_de_empleado INT NOT NULL UNIQUE, -- numero de empleado que se le asigna a cada empleado
    nombre_usuario VARCHAR(50) NOT NULL, -- nombre
    apellido_paterno_usuario VARCHAR(50) NOT NULL, -- apellido paterno
    apellido_materno_usuario VARCHAR(50), -- apellido materno
    contrasenia_usuario VARCHAR(100) NOT NULL, -- contrasenia 
    rol_usuario INT, -- llave foranea

    FOREIGN KEY (rol_usuario) REFERENCES roles(id_rol)
);

-- La tabla categoria es para clasificar los productos de acuerdo a la cofepris

CREATE TABLE categoria_producto (
    id_categoria_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria_producto VARCHAR(50) NOT NULL, -- analgesico, antibiotico, etc
    descripcion_categoria_producto TEXT NOT NULL  -- Para que sirve la categoria, que tipo de productos pertenecen a esta categoria
);

-- la tabla grupo de control es para clasificar en grupos de acuerdo a la cofepris

CREATE TABLE grupo_control (
    id_grupo_control INT PRIMARY KEY AUTO_INCREMENT,
    nombre_grupo_control VARCHAR(10) NOT NULL, -- I, II, III, IV, V, VI
    descripcion_grupo_control TEXT NOT NULL  -- Para que sirve el grupo de control
);

CREATE TABLE tipo_recetas (
    id_tipo_receta INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipo_receta VARCHAR(50) NOT NULL, -- receta general, receta controlada, etc
    descripcion_tipo_receta TEXT,  -- Para que sirve el tipo de receta, que tipo de productos pertenecen a este tipo de receta
    requiere_receta BOOLEAN NOT NULL, -- Si el producto requiere receta o no
    requiere_retencion BOOLEAN NOT NULL -- Si el producto requiere retencion o no
);

CREATE TABLE recetas (
    id_receta INT PRIMARY KEY AUTO_INCREMENT,
    nombre_paciente VARCHAR(100) NOT NULL,
    nombre_doctor VARCHAR(100) NOT NULL,
    cedula_profesional_doctor VARCHAR(50),
    fecha_receta DATE NOT NULL,
    archivo_receta VARCHAR(255), -- Para almacenar la imagen de la receta
    observaciones_receta TEXT -- Para que el doctor pueda escribir alguna indicacion adicional
);

/*En productos*/
CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    codigo_producto VARCHAR(50) UNIQUE, --Codigo de barras
    nombre_producto VARCHAR(100) NOT NULL, --Nombre comercial o el componente
    componente_activo_producto VARCHAR(200), --Componente del medicamento
    uso_producto VARCHAR(50), -- SI ES PARA ADULTOS, NIÑOS, ETC
    clasificacion_producto VARCHAR(20), --Patente, generico
    tipo_producto VARCHAR(50) NOT NULL, --medicamento, higiene, belleza, etc
    categoria_producto INT, -- llave foranea
    descripcion_producto TEXT NOT NULL, --Para que sirve
    grupo_control INT, -- llave foranea
    venta_unitaria BOOLEAN,
    presentacion VARCHAR(50) NOT NULL, -- caja, frasco, tubo
    contenido_neto_producto VARCHAR(50) NOT NULL, -- cuantas tabletas, cuantos mL y mg
    precio_venta DECIMAL(10,2) NOT NULL,
    id_tipo_receta INT, -- llave foranea

    FOREIGN KEY (categoria_producto) REFERENCES categoria_producto(id_categoria_producto),
    FOREIGN KEY (grupo_control) REFERENCES grupo_control(id_grupo_control),
    FOREIGN KEY (id_tipo_receta) REFERENCES tipo_recetas(id_tipo_receta)
);

-- esta tabla es para registrar como vienen los medicamentos, es decir, en tabletas o tiras
-- en caso de que se pueda vender de manerea individual
CREATE TABLE unidad_producto (
    id_unidad_producto INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT, -- llave foranea
    unidad_producto VARCHAR(50) NOT NULL, -- CAJA, TIRA, TABLETA.
    cantidad_unidad_producto INT NOT NULL, -- Cuantas tabletas hay en una caja, cuantas tabletas hay en una tira, etc
    precio_unidad_producto DECIMAL(10,2) NOT NULL, -- El precio de cada unidad
    
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- en lote de producto es porque los productos vienen diferentes tipos de lotes por lo que 
-- se compra a diferentes precios, con diferentes fechas de caducidad
CREATE TABLE lote_producto(
    id_lote INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT, -- llave foranea
    lote_producto VARCHAR(50) NOT NULL,
    fecha_caducidad DATE, 
    fecha_compra DATE,  --Cuando se adquiere el producto
    precio_compra DECIMAL(10,2) NOT NULL, --El precio con el que se compro
    stock_unidades INT NOT NULL,

    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- tabla para el registro de ventas
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT, -- llave foranea
    fecha_venta DATETIME NOT NULL,
    total_venta DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- tabla para el registro del producto vendido y del lote, el precio y el total
CREATE TABLE detalle_venta (
    id_detalle_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT, -- llave foranea
    id_lote INT, -- llave foranea
    id_unidad_producto INT, -- llave foranea
    cantidad INT NOT NULL, -- cuantos productos se vendieron
    precio_unitario DECIMAL(10,2) NOT NULL, --cuanto costo cada unidad
    id_receta INT,

    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_lote) REFERENCES lote_producto(id_lote),
    FOREIGN KEY (id_unidad_producto) REFERENCES unidad_producto(id_unidad_producto),
    FOREIGN KEY (id_receta) REFERENCES recetas(id_receta)
);

--tabla de proveedores, por si es necesario registrar estos datos para que el administrador
-- pueda solicitar los productos al proveedor
CREATE TABLE proveedores (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proveedor VARCHAR(100) NOT NULL,
    direccion_proveedor VARCHAR(200) NOT NULL,
    telefono_proveedor VARCHAR(20) NOT NULL,
    correo_proveedor VARCHAR(100) NOT NULL
);

-- tabla para el registro de las compras realizadas a los proveedores, para llevar un control
CREATE TABLE compras (
    id_compra INT PRIMARY KEY AUTO_INCREMENT,
    id_proveedor INT, -- llave foranea
    fecha_compra DATETIME NOT NULL,
    total_compra DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

-- detalles de la compra, para registrar que productos se compraron y de que lote
CREATE TABLE detalle_compra (
    id_detalle_compra INT PRIMARY KEY AUTO_INCREMENT,
    id_compra INT, -- llave foranea
    id_lote INT, -- llave foranea
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_compra) REFERENCES compras(id_compra),
    FOREIGN KEY (id_lote) REFERENCES lote_producto(id_lote)
);


--tabla para registrar las promociones que se aplicana a los productos
CREATE TABLE promociones (
    id_promocion INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT, -- llave foranea
    porcentaje_descuento DECIMAL(5,2) NOT NULL, -- El porcentaje de descuento que se aplicará al producto
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,

    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);


--tabla de aleras para el administrador.
Create table alertas(
    id_alerta INT PRIMARY KEY AUTO_INCREMENT,
    tipo_alerta VARCHAR(50) NOT NULL, -- STOCK BAJO, PRODUCTO FALTANTE, PROXIMO A CADUCAR
    mensaje_alerta TEXT NOT NULL, --el mensaje que se mostrará en la alerta
    id_producto INT, -- llave foranea, el producto al que se refiere la alerta
    fecha_alerta DATETIME Default CURRENT_TIMESTAMP,
    leida BOOLEAN DEFAULT FALSE, -- mensaje leido o no

    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);