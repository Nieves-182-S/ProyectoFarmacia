/* Tablas aun no terminadas */

CREATE TABLE productos (
    id_producto INT PRIMARY KEY;
    codigo_producto VARCHAR(50);
    nombre_producto VARCHAR(100);
)

CREATE TABLE lote_producto(
    id_lote INT PRIMARY KEY;
    lote_producto VARCHAR(50);
    fecha_caducidad DATE;
    precio_compra DECIMAL(10,2);
    precio_venta DECIMAL(10,2)
)