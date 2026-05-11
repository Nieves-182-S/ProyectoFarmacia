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
---------------------------------------------------------------------------------------------
#Dudas
¿Porque creación de BD va separado de las tablas?
Investigué que va en el brief, entonces ¿ahí pongo todo lo que me gutaría que hiciera el sistema que se esta creando?

Simplemente por orden, para que empecemos a separar todo y podamos ver qué cambios va generando cada uno, y ver si algo falla en dónde lo podemos modificar.

---------------------------------------------------------------------------------------------

#28/04/2026
#Actividades
-Volví a revisar las tablas entidad-relación para hacer las tablas de la base de datos.
-Continué con la creación de la base de datos, creando las tablas principales, como usuarios, roles, productos, lotes, etc.
-Agregué las relaciones de las tablas, como la relación entre usuarios y roles, etc.
-Continué con el brief, agregando más detalles de las funcionalidades que me gustaría para el sistema.
#Lo aprendido
-Repaso de SQL para la creación de tablas y relaciones
-Importancia de tener un brief detallado para el desarrollo del proyecto

---------------------------------------------------------------------------------------------
#Dudas
¿Cómo agregar la parte de ventas por unidad?

Para agregar ventas por unidad en el sistema de farmacia, es necesario que en la base de datos los productos tengan un campo que indique si pueden venderse por unidad, caja, frasco, etc. Además, se debe definir la cantidad de unidades por empaque y permitir que, al registrar una venta, se pueda seleccionar la cantidad exacta de unidades a vender. Esto implica ajustar tanto el modelo de datos (tablas de productos y ventas) como la lógica en el sistema para controlar el inventario y los precios por unidad y por empaque. Así se podrá llevar un control preciso de las existencias y ventas, ya sea por unidad o por presentación completa.

---------------------------------------------------------------------------------------------
#30/04/2026
#Actividades
-Terminé de crear las tablas de la base de datos
-Agregué los roles en inserts
-Agregué la consulta para ver todo de todas las tablas
-puse mi paleta de colores, modifiqué algunos archivos
-Inicié con el diseño en figma

#Lo aprendido
-La importancia de tener una tabla entidad relacion
-Consultas con JONS sigo en retroalimentacion
---------------------------------------------------------------------------------------------#Dudas

1.-Para incluir imagenes en la base de datos, ¿es mejor guardar la imagen en una carpeta y guardar la ruta en la base de datos o guardar la imagen directamente en la base de datos?

Lo más recomendable es guardar las imágenes en una carpeta o almacenamiento externo y en la base de datos solo guardar la ruta o el nombre del archivo. Así la base de datos queda más ligera, es más fácil administrar las imágenes y el sistema puede cargar más rápido. Guardarlas directamente en la base de datos suele hacerla más pesada y menos práctica.

---------------------------------------------------------------------------------------------
#02/05/2026
#Actividades
-Terminé la primera pantalla del diseño en figma
-Agregué datos a la base de datos para probar las consultas posteriormente
-Agregué otras tablas que se me habían pasado
---------------------------------------------------------------------------------------------

#Dudas
1.¿Podrías revisar la base de datos por si hay algo que no estoy viendo?

Al revisar la base de datos, noté que primero hace falta definir bien cómo se manejará el inventario, sobre todo porque habrá ventas por unidad. También conviene aclarar qué precio se usará en cada caso, ya que aparece precio en producto, en unidad y en detalle de venta. Otro punto importante es revisar la relación entre compras y lotes, para que el registro de mercancía tenga más sentido. Además, algunos datos como presentación, tipo o clasificación podrían manejarse mejor para evitar capturas repetidas o diferentes formas de escribir lo mismo.

2.¿Cómo agrego mi tabla entidad relación del proyecto? 

La tabla entidad-relación se puede agregar como imagen dentro de la documentación del proyecto, por ejemplo en el README o en una carpeta destinada a documentación o evidencias. También puede incluirse en la bitácora o en el brief si forma parte de la explicación del sistema. Lo importante es que esté visible para entender cómo se relacionan las tablas de la base de datos.

3.¿Habrá carpetas para guardar las imágenes?

Sí, lo ideal es crear una carpeta específica para las imágenes del proyecto. Por ejemplo, se puede tener una carpeta para imágenes del sistema y otra para documentos como recetas o evidencias. Esto ayuda a mantener todo ordenado y facilita después guardar en la base de datos solo la ruta de cada archivo

#04/05/2026
#Actividades
-Modifiqué la base de datos
-continue con el diseño en figma
-Terminé los inserts de la base de datos para las pruebas
-Comencé con las consultas básicas para probar la base de datos
---------------------------------------------------------------------------------------------
#Dudas
Por ahora no tengo dudas, pero te mandaré la liga de figma para que me digas que tal ;D

#05/05/2026
#Actividades
-Continué con el diseño en figma
-Modifiqué los inserets porque me di cuenta que había algunos errores
-Agregué consultas básicas y concatenaciones, solo seguí el ejemplo del libro
---------------------------------------------------------------------------------------------
#Lo aprendido
-Hacer concatenaciones en SQL, me gustó, son como los joins pero en columnas... 
#Dudas
¿En el documento de consultas son solo para consultas y filtros, supongo que joins y subconsultas, 
pero los trigger y procedimientos van en otro documento?

Sí, el documento de consultas puede usarse solo para consultas y filtros, como SELECT, JOIN y subconsultas. En cambio, los TRIGGER, procedimientos almacenados y funciones conviene ponerlos en otro archivo aparte, para tener mejor organización y diferenciar las consultas de los procesos automáticos de la base de datos.

----------------------------------------------------------------------------------------------------------------------------------------

#06/05/2026 #Actividades -Continué con el diseño en figma, ya casi queda la segunda pantalla :( -Agregué más consultas a la base de datos. -Agregué inserts en la parte de producto_faltante para aumentar la cantidad de solicitudes de productos faltantes. -Leí una parte del libro que me enviaste para seguir aprendiendo y hacer una retroalimentación más completa. 

#Lo aprendido -Empecé a entender más a fondo sobre concatenaciones, que interesante... #Dudas Puedes revisar otra vez la BD y a ver si ya esta mejor o ya bien, una vez que termine las consultas ya podré seguir con la estructura en java, pero esperaré al terminar consultas y autorices :D

Al revisar nuevamente la base de datos, detecté estos errores puntuales:

    1.-En los inserts de producto_faltante hay un registro donde se indican dos columnas, pero solo se proporciona un valor, por lo que ese insert puede fallar.
    2.-En algunos inserts para actualizar productos faltantes se intenta modificar una columna que no existe en la tabla, así que esa parte también generaría error.
    3.-En el archivo de consultas hay una consulta donde el nombre de la tabla producto_faltante está escrito de forma incorrecta.
    4.-También hay una consulta donde el nombre de la tabla tipo_recetas no coincide con el nombre real creado en la base de datos.
    5.-Algunos datos de prueba no coinciden del todo con la lógica del sistema, por ejemplo un producto de cuidado personal aparece relacionado como si fuera medicamento.
    6.-En movimientos de inventario se usan nombres de tipos de movimiento distintos a los que se plantearon originalmente, así que conviene unificarlos.
    7.-El número de empleado está definido como entero, por lo que si lleva ceros al inicio, esos ceros se pueden perder al guardarse.

En la parte de consultas ya se cubren consultas básicas como mostrar datos, aplicar filtros, hacer búsquedas y usar concatenaciones. Aun así, faltan consultas más funcionales para el punto de venta. Hace falta agregar:

    1.-Consultas con joins para mostrar el detalle completo de ventas.
    2.-Consultas para ver el inventario actual por producto y por lote.
    3.-Consultas para productos próximos a caducar.
    4.-Consultas para promociones activas.
    5.-Consultas para productos más vendidos.
    6.-Consultas de compras unidas con proveedor y detalle.
    7.-Consultas para productos que requieren receta.
    8.-Revisión de nombres de tablas en algunas consultas para que coincidan con la base de datos real.

Felicidades, María. En verdad, no lo digo solo porque te quiero, sino porque eres muy brillante. Sigue exigiéndote y avanzando como lo has hecho. Por el momento, hay que modificar estos detalles y, después de eso, ya podremos empezar con la estructura en Java.<3

-----------------------------------------------------------------------------------------------------------------------------------------------------

#07/05/2026
#Actividades
-Continué con el diseño en figma, me falta algunos detalles.
-Agregué más consultas a la base de datos, como consultas con filtros, joins.
-Leí más del libro para seguir aprendiendo sobre SQL y mejorar mis consultas.

Revisé las consultas nuevas y sí hay avance, pero todavía hay algunos detalles puntuales por corregir. Hay consultas con nombres de tablas incorrectos, por ejemplo productos_faltante en lugar de producto_faltante, y tipo_receta en lugar de tipo_recetas, así que esas fallarían al ejecutarse. También conviene separar los UPDATE del archivo de consultas, para que una cosa sea el bloque de consultas y otra el bloque de modificaciones; así queda más ordenado y después será más fácil programarlo en Java.

Como mejora de SQL, también ayudaría agrupar las consultas por tema y dejar primero las consultas simples, luego los filtros, después las concatenaciones y al final los JOIN. Eso haría el archivo más claro y más fácil de mantener. En general va bien, solo hace falta corregir esos nombres y ordenar mejor el archivo.

Por el moemnto solo eso, pero mmuy bien, sigues sin mandarme lo de figmaaaaaaaaaaaaaaaaaaaa, te pasas, pero bueno, checalo. 