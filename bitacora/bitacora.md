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
Investigué que va en el brief, entonces ¿ahí pongo todo lo que me gutaría que hiciera el sistema que se esta creando?

#28/04/2026
#Actividades
-Volví a revisar las tablas entidad-relación para hacer las tablas de la base de datos.
-Continué con la creación de la base de datos, creando las tablas principales, como usuarios, roles, productos, lotes, etc.
-Agregué las relaciones de las tablas, como la relación entre usuarios y roles, etc.
-Continué con el brief, agregando más detalles de las funcionalidades que me gustaría para el sistema.
#Lo aprendido
-Repaso de SQL para la creación de tablas y relaciones
-Importancia de tener un brief detallado para el desarrollo del proyecto
#Dudas
¿Cómo agregar la parte de ventas por unidad?

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

#Dudas
Para incluir imagenes en la base de datos, ¿es mejor guardar la imagen en una carpeta y guardar la ruta en la base de datos o guardar la imagen directamente en la base de datos?

#02/05/2026
#Actividades
-Terminé la primera pantalla del diseño en figma
-Agregué datos a la base de datos para probar las consultas posteriormente
-Agregué otras tablas que se me habían pasado

#Dudas
¿Podrías revisar la base de datos por si hay algo que no estoy viendo?
¿Cómo agrego mi tabla entidad relación del proyecto? 
¿Habrá carpetas para guardar las imágenes?

#04/05/2026
#Actividades
-Modifiqué la base de datos
-continue con el diseño en figma
-Terminé los inserts de la base de datos para las pruebas
-Comencé con las consultas básicas para probar la base de datos

#Dudas
Por ahora no tengo dudas, pero te mandaré la liga de figma para que me digas que tal ;D

#05/05/2026
#Actividades
-Continué con el diseño en figma
-Modifiqué los inserets porque me di cuenta que había algunos errores
-Agregué consultas básicas y concatenaciones, solo seguí el ejemplo del libro

#Lo aprendido
-Hacer concatenaciones en SQL, me gustó, son como los joins pero en columnas... 
#Dudas
¿En el documento de consultas son solo para consultas y filtros, supongo que joins y subconsultas, 
pero los trigger y procedimientos van en otro documento?

#06/05/2026
#Actividades
-Continué con el diseño en figma, ya casi queda la segunda pantalla :(
-Agregué más consultas a la base de datos.
-Agregué inserts en la parte de producto_faltante para aumentar la cantidad de solicitudes de productos faltantes.
-Leí una parte del libro que me enviaste para seguir aprendiendo y hacer una retroalimentación más completa.
#Lo aprendido
-Empecé a entender más a fondo sobre concatenaciones, que interesante... 
#Dudas
Puedes revisar otra vez la BD y a ver si ya esta mejor o ya bien, una vez que termine las consultas ya podré seguir con 
la estructura en java, pero esperaré al terminar consultas y autorices :D

#07/05/2026
#Actividades
-Continué con el diseño en figma, me falta algunos detalles.
-Agregué más consultas a la base de datos, como consultas con filtros, joins.
-Leí más del libro para seguir aprendiendo sobre SQL y mejorar mis consultas.

#13/05/2026
#Actividades
- Ordené la parte de consultas como me lo sugeriste.
- Agregúe más consultas a la base de datos.
- Ya cambié los nombres que si maracaban error.

#14/05/2026
#Actividades
- Revisé la parte de datos para lo de la contraseña
- Agregué una consulta más de las que me sugeriste de detalle join para mostrar el detalle de las ventas.
- Separar las consultas basicas con las más importantes.
- Te comparto la liga de figma https://www.figma.com/design/p1zDec3lUcBKO7ZzVPxg9C/Farmacia?node-id=0-1&m=dev&t=wqzWB7XWW9Q0Tzjg-1
Me avisas si se puede ver o no vale?

#Lo aprendido
- Los tipos de datos para las contraseñas

#Dudas
Me avisas que tal esta la parte de figma, sigo modificando detalles, y lo de la parte de joins para ver detalle de ventas.
La idea es que el administrador permita dar los datos de usuario y contraseña a los empleados, entonces ahí el sistema no puede registrar
a otros usuarios pero el administrador si, entonces como le hago para que pase esto? en la realidad solo agrego a la base al 
administrador para que pueda acceder y crear otros usuarios, pero con lo de la incriptación de contraseñas, ¿cómo le hago?

#15/05/2026
#Actividades
- Terminé la segunda pantalla del diseño de figma.
- Agregué una tabla más a la base de datos para encontrar donde va el producto dentro de la farmacia, esto para que cuando se realice una 
busqueda de un producto, el sistema pueda mostrarle al usuario la ubicación del producto dentro de la farmacia, para facilitarle la búsqueda.
- Relacioné todas las tablas de esta la nueva tabla a la que corresponde.
- Agregué inserts para la nueva tabla y modifiqué la tabla de productos para agregar la relacion nueva, así como sus inserts.
- Empecé la segunda consulta util sugerido por usted, no lo he terminado... 

#Dudas
Ya subí la tabla de entidad relación, hay ids que se repiten en las tablas por las relaciones que hay entre las tablas, me gustaria saber si
eso es un problema para la base de datos, la base la realice con las relaciones importantes para mi pero si me dices que tengo que agregar
las ids que se fueron también por las relaciones me avisas jaja... descansa, gracias por tu ayuda :D
