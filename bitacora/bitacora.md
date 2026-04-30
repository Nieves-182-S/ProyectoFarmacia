#Bitácora de avances

#27/04/2026

#Actividades
-Cree la estructura del proyecto de farmacia
-En cada carpeta coloqué los archivos que deben contener
-Inicialicé el repositorio en GitHub
-Realice el primer commit para subir las carpetas

#Lo aprendido
-Cómo organizar un proyecto
-Para que sirve un archivo .md
-Como subir los avances a git.

#Dudas

¿Porque creación de BD va separado de las tablas?
Simplemente por orden, para que empecemos a separar todo y podamos ver qué cambios va generando cada uno, y ver si algo falla en dónde lo podemos modificar.

Investigué que va en el brief, entonces ¿ahí pongo todo lo que me gustaría que hiciera el sistema que se está creando?
Así es, es mejor, es más para que me oriente y podamos ir debatiendo qué es lo mejor. Igual el propósito de todo lo que hagamos, la publicidad a qué va dirigida, exponer la marca, ventas y así, y dado ese propósito vamos a trabajar. Más tarde te mandaré algunos folletos o así que trabajan aquí para ideas, lo ideal es reutilizar algunos de Canva y solo modificar información, igual ahí modificaremos todo. Todo esto para verse profesional.

#28/04/2026
#Actividades
-Volví a revisar las tablas entidad-relación para hacer las tablas de la base de datos.
-Continué con la creación de la base de datos, creando las tablas principales, como usuarios, roles, productos, lotes, etc.
-Agregué las relaciones de las tablas, como la relación entre usuarios y roles, etc.
-Continué con el brief, agregando más detalles de las funcionalidades que me gustaría para el sistema.
#Lo aprendido
Te felicito, perdón por no haber estado antes, pero ya terminé los pendientes y ahora podré dedicarte todo el tiempo que te mereces. Sigue repasando; si quieres, más tarde por Zoom podemos revisar más cosas o resolver dudas que no te dejen avanzar. Si no, el día que nos veamos las resolvemos. Lo nuestro de hablar por WhatsApp y Git es impresionante, jajaja. ¡Felicidades!

-Repaso de SQL para la creación de tablas y relaciones
-Importancia de tener un brief detallado para el desarrollo del proyecto

#Dudas
¿Cómo agregar la parte de ventas por unidad?

Para agregar ventas por unidad en el sistema de farmacia, es necesario que en la base de datos los productos tengan un campo que indique si pueden venderse por unidad, caja, frasco, etc. Además, se debe definir la cantidad de unidades por empaque y permitir que, al registrar una venta, se pueda seleccionar la cantidad exacta de unidades a vender. Esto implica ajustar tanto el modelo de datos (tablas de productos y ventas) como la lógica en el sistema para controlar el inventario y los precios por unidad y por empaque. Así se podrá llevar un control preciso de las existencias y ventas, ya sea por unidad o por presentación completa.
