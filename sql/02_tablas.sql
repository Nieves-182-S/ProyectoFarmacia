/*Existen dos tipos de usuarios, el administrador y los cajeros*/
create table roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(20) NOT NULL UNIQUE -- administrador, cajero
);

CREATE TABLE formas_farmaceuticas (
    id_forma_farmaceutica INT PRIMARY KEY AUTO_INCREMENT,
    nombre_forma_farmaceutica VARCHAR(50) NOT NULL, -- tableta, jarabe, crema, etc
    descripcion_forma_farmaceutica TEXT NOT NULL -- Para que sirve la forma farmaceutica, tomada o inyectada, etc
);

CREATE TABLE tipo_producto (
    id_tipo_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipo_producto VARCHAR(50) NOT NULL -- medicamento, higiene, belleza, etc
);

CREATE TABLE clasificacion_producto (
    id_clasificacion_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_clasificacion_producto VARCHAR(20) NOT NULL -- patente, generico
);

-- Esta tabla es para registrar los productos que faltan en la farmacia, para que el 
-- administrador pueda solicitarlo al proveedor
CREATE TABLE producto_faltante (
    id_producto_faltante INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto_faltante VARCHAR(100) NOT NULL UNIQUE, -- Nombre comercial o el componente del medicamento
    presentacion_producto_faltante VARCHAR(100), 
    cantidad_solicitada INT DEFAULT 1,
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
    contrasenia_usuario VARCHAR(250) NOT NULL, -- contrasenia 
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

-- tabla de ubicacion del producto dentro de la farmacia.
CREATE TABLE ubicacion_producto (
    id_ubicacion INT PRIMARY KEY AUTO_INCREMENT,
    letra_estante VARCHAR(5) NOT NULL, -- A, B, C, D, E
    nivel_estante INT NOT NULL, -- 1, 2, 3, 4, 5
    id_grupo_control INT, -- llave foranea

    FOREIGN KEY (id_grupo_control) REFERENCES grupo_control(id_grupo_control)
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
    direccion_doctor VARCHAR(200),
    cedula_profesional_doctor VARCHAR(50),
    fecha_receta DATE NOT NULL,
    archivo_receta VARCHAR(255), -- Para almacenar la imagen de la receta
    observaciones_receta TEXT, -- Para que el doctor pueda escribir alguna indicacion adicional
    id_tipo_receta INT, -- llave foranea
    FOREIGN KEY (id_tipo_receta) REFERENCES tipo_recetas(id_tipo_receta)
);

--  tabla de proveedores, por si es necesario registrar estos datos para que el administrador
-- pueda solicitar los productos al proveedor
CREATE TABLE proveedores (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proveedor VARCHAR(100) NOT NULL,
    direccion_proveedor VARCHAR(200),
    telefono_proveedor VARCHAR(20),
    correo_proveedor VARCHAR(100)
);

-- tabla para el registro de las compras realizadas a los proveedores, para llevar un control
CREATE TABLE compras (
    id_compra INT PRIMARY KEY AUTO_INCREMENT,
    id_proveedor INT, -- llave foranea
    fecha_compra DATETIME NOT NULL,
    total_compra DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

/*En productos*/
CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    codigo_producto VARCHAR(50) UNIQUE, -- Codigo de barras
    nombre_producto VARCHAR(100) NOT NULL, -- Nombre comercial o el componente
    componente_activo_producto VARCHAR(200), -- Componente del medicamento
    uso_producto VARCHAR(50), -- SI ES PARA ADULTOS, NIÑOS, ETC
    unidad_base VARCHAR(50),
    id_clasificacion_producto INT, -- Patente, generico
    id_tipo_producto INT, -- medicamento, higiene, belleza, etc
    id_categoria_producto INT, -- llave foranea
    descripcion_producto TEXT NOT NULL, -- Para que sirve
    id_grupo_control INT, -- llave foranea
    venta_unitaria BOOLEAN,
    contenido_neto_producto VARCHAR(50) NOT NULL, -- cuantas tabletas, cuantos mL y mg
    id_tipo_receta INT, -- llave foranea
    id_forma_farmaceutica INT, -- llave foranea
    id_ubicacion INT, -- llave foranea

    FOREIGN KEY (id_categoria_producto) REFERENCES categoria_producto(id_categoria_producto),
    FOREIGN KEY (id_grupo_control) REFERENCES grupo_control(id_grupo_control),
    FOREIGN KEY (id_tipo_receta) REFERENCES tipo_recetas(id_tipo_receta),
    FOREIGN KEY (id_forma_farmaceutica) REFERENCES formas_farmaceuticas(id_forma_farmaceutica),
    FOREIGN KEY (id_tipo_producto) REFERENCES tipo_producto(id_tipo_producto),
    FOREIGN KEY (id_clasificacion_producto) REFERENCES clasificacion_producto(id_clasificacion_producto),
    FOREIGN KEY (id_ubicacion) REFERENCES ubicacion_producto(id_ubicacion)
);

-- en lote de producto es porque los productos vienen diferentes tipos de lotes por lo que 
-- se compra a diferentes precios, con diferentes fechas de caducidad
CREATE TABLE lote_producto(
    id_lote INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT, -- llave foranea
    lote_producto VARCHAR(50) NOT NULL,
    fecha_caducidad DATE, 
    precio_compra DECIMAL(10,2) NOT NULL, -- El precio con el que se compro
    stock_unidades INT NOT NULL, -- los medicamentos que se puedan vender de manera individual, se registra la cantidad de unidad minima que tenga el medicamento, es decir, si se vende en tabletas, se registra la cantidad de tabletas que hay.

    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    CHECK (stock_unidades >= 0)
);

-- detalles de la compra, para registrar que productos se compraron y de que lote
CREATE TABLE detalle_compra (
    id_detalle_compra INT PRIMARY KEY AUTO_INCREMENT,
    id_compra INT, -- llave foranea
    id_lote INT, -- llave foranea
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_compra) REFERENCES compras(id_compra),
    FOREIGN KEY (id_lote) REFERENCES lote_producto(id_lote),
    CHECK (cantidad > 0),
    CHECK (precio_unitario >= 0)
);

-- esta tabla es para registrar como vienen los medicamentos, es decir, en tabletas o tiras
-- en caso de que se pueda vender de manerea individual
CREATE TABLE unidad_producto (
    id_unidad_producto INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT, -- llave foranea
    unidad_producto VARCHAR(50) NOT NULL, -- CAJA, TIRA, TABLETA.
    cantidad_unidad_producto INT NOT NULL, -- Cuantas tabletas hay en una caja, cuantas tabletas hay en una tira, etc
    precio_unidad_producto DECIMAL(10,2) NOT NULL, -- El precio de cada unidad
    UNIQUE (id_producto, unidad_producto), -- Para que no se repita la misma unidad para el mismo producto

    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    CHECK (precio_unidad_producto >= 0)
);

CREATE TABLE movimientos_inventario (
    id_movimiento INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT NOT NULL,
    id_lote INT,
    tipo_movimiento VARCHAR(20) NOT NULL, -- COMPRA, VENTA, MERMA, AJUSTE
    cantidad INT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_lote) REFERENCES lote_producto(id_lote),
    CHECK (cantidad > 0)
);

-- tabla para el registro de ventas
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT, -- llave foranea
    fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP,
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
    precio_unitario DECIMAL(10,2) NOT NULL, -- cuanto costo cada unidad
    id_receta INT,

    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_lote) REFERENCES lote_producto(id_lote),
    FOREIGN KEY (id_unidad_producto) REFERENCES unidad_producto(id_unidad_producto),
    FOREIGN KEY (id_receta) REFERENCES recetas(id_receta),
    CHECK (cantidad > 0),
    CHECK (precio_unitario >= 0)
);

-- tabla para registrar las promociones que se aplicana a los productos
CREATE TABLE promociones (
    id_promocion INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT, -- llave foranea
    porcentaje_descuento DECIMAL(5,2) NOT NULL, -- El porcentaje de descuento que se aplicará al producto
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,

    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE tipo_alerta (
    id_tipo_alerta INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tipo_alerta VARCHAR(50) UNIQUE NOT NULL
);

-- tabla de aleras para el administrador.
Create table alertas(
    id_alerta INT PRIMARY KEY AUTO_INCREMENT,
    id_tipo_alerta INT, -- llave foranea
    mensaje_alerta TEXT NOT NULL, -- el mensaje que se mostrará en la alerta
    id_producto INT, -- llave foranea, el producto al que se refiere la alerta
    fecha_alerta DATETIME Default CURRENT_TIMESTAMP,
    leida BOOLEAN DEFAULT FALSE, -- mensaje leido o no

    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_tipo_alerta) REFERENCES tipo_alerta(id_tipo_alerta)
);