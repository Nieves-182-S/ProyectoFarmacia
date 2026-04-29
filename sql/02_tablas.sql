/* Tablas aun no terminadas */

/*Existen dos tipos de usuarios, el administrador y los cajeros*/
create table roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT;
    nombre_rol VARCHAR(50) NOT NULL; -- administrador, cajero
)

CREATE TABLE usuarios (
    id_usuarios INT PRIMARY KEY AUTO_INCREMENT;
    nombre_usuario VARCHAR(50) NOT NULL;
    apellido_paterno_usuario VARCHAR(50) NOT NULL;
    apellido_materno_usuario VARCHAR(50);
    correo_usuario VARCHAR(100) NOT NULL;
    contrasenia_usuario VARCHAR(100) NOT NULL;
    rol_usuario VARCHAR(50) NOT NULL; -- administrador, cajero

    FOREIGN KEY (rol_usuario) REFERENCES roles(nombre_rol)
)

/*En productos*/
CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT;
    codigo_producto VARCHAR(50); --Codigo de barras
    nombre_producto VARCHAR(100) NOT NULL; --Nombre comercial o el componente
    componente_activo_producto VARCHAR(200); --Componente del medicamento
    clasificacion_producto VARCHAR(20); --Patente, generico
    tipo_producto VARCHAR(50) NOT NULL; --medicamento, higiene, belleza, etc
    categoria_producto VARCHAR(50); --analgesico, antibiotico, etc
    descripcion_producto TEXT NOT NULL; --Para que sirve
    grupo_control VARCHAR(10); --I, II, III, IV, V, VI
    venta_unitaria BOOLEAN;
    presentacion VARCHAR(50) NOT NULL; -- caja, frasco, tubo
    contenido_neto_producto VARCHAR(50) NOT NULL; -- cuantas tabletas, cuantos mL y mg
    precio_venta DECIMAL(10,2) NOT NULL;
)

CREATE TABLE lote_producto(
    id_lote INT PRIMARY KEY AUTO_INCREMENT;
    id_producto INT; -- llave foranea
    lote_producto VARCHAR(50) NOT NULL;
    fecha_caducidad DATE; 
    fecha_compra DATE;  --Cuando se adquiere el producto
    precio_compra DECIMAL(10,2) NOT NULL; --El precio con el que se compro
    stock INT NOT NULL;

    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
)

CREATE TABLE ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT;
    id_usuario INT; -- llave foranea
    fecha_venta DATETIME NOT NULL;
    total_venta DECIMAL(10,2) NOT NULL;

    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
)

CREATE TABLE detalle_venta (
    id_detalle_venta INT PRIMARY KEY AUTO_INCREMENT;
    id_venta INT; -- llave foranea
    id_lote INT; -- llave foranea
    cantidad INT NOT NULL;
    precio_unitario DECIMAL(10,2) NOT NULL;

    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta);
    FOREIGN KEY (id_lote) REFERENCES lote_producto(id_lote);
)

CREATE TABLE proveedores (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT;
    nombre_proveedor VARCHAR(100) NOT NULL;
    direccion_proveedor VARCHAR(200) NOT NULL;
    telefono_proveedor VARCHAR(20) NOT NULL;
    correo_proveedor VARCHAR(100) NOT NULL;
)
