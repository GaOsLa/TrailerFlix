# TRAILER FLIX 
Esta se trata de una desarrollo Back End para el proyecto integrador 2023 en la cual podra consultar un listado de titulos de peliculas y series y obtener los diferentes datos registrados de la misma en una base SQL

## ARCHIVO COMPRIMIDO: Contenido
en el mismo ud podra encontrar
* *carpeta* posters--> contiene imagenes de los posters de todas las peliculas
* *carpeta:* src --> 
    * conecciones: --> los datos para la coneccion a MySQL
    * modelos: --> los distintos modelos de consultas de la BBDD
        * categorias.js
        * tbgenero.js
        * vwCatalogo.js
        * vwCatGen.js
* *archivo:* esquema_BBDD.pdf
* *archivo:* generar_Trailerflix.sql
* *archivo:* server.js --> donde se encuentran los distintos endpoints solicitados en la consigna
*  *archivo:* ' LEER.md'

## BASE DE DATOS
Nombre: *trailerflix*
Modelo: *MySQL*
Modo de generacion: 
se debera descargar e instalar el archivo con el script *generar_trailerflix.sql* (leer apartado **atencion**) y ejecutarlo a travez de una consulta. 
#### ATENCION: 
En la linea 2 del script esta la sentencia: **DROP SCHEMA IF EXISTS trailerflix**
con la que en caso de existir va a borrar la base de datos denominada **trailerflix**
lo que podria provocar la perdida irreversible de datos. Se sugiere renombrar la BBDD existente antes de ejecutar el script
Al ejecutar el script se generara una nueva base de datos con todas sus tablas, relaciones, contenidos y vistas correspondientes y necesarias para la ejecucion del sistema requerido.

## SERVER.JS
En este ud podra encontrar los distintos endpoints, a saber:
***get("/categorias")***
En este podra consultar todas las categorias existentes entre los distintos registros de la BBDD.

***get("/catalogo/categorias/:categoria")***
Podra listar todos los registros existentes con una categoria determinada. se aconseja primero revisar el EP correspondiente a /categorias y tomar nota de que categoria se desea consultar.
En caso de no ingresar nada detras de los ":" podra ver en el RESPONSE un listado de categorias disponibles

***get("/catalogo")***
Aqui se podrá consultar el catalogo completo de peliculas registradas con todos sus datos exitentes.

***get("/catalogo/TITULOS")***
Este endpoint(EP) listara todos los registros exitentes por titulo

***get("/catalogo/titulos/:id")***
devuelve como resultado el registro completo de un ID existente en la BBDD

***get("/catalogo/titulo/:titulo")***
La funcionalidad es buscar entre los distintos registros en la BBDD y extraer aquellos titulos de peliculas que se encuentren registrados, se debera ingresar el nombre completo del mismo.

***get("/catalogo/genero/")***
En caso de omitir ingresar algun dato luego de la barra "/" final, deberia listar un grupo de posibles generos disponibles para consultar, los que al cargarlos le llevara al  siguiente Endpoint

***get("/catalogo/genero/:genero")***
Mediante este EP se podra consultar todos los generos existentes en los distintos registros de la BBDD y ver los titulos a los cuales corresponden.

## Resumen Endpoints
| **metodo** | **endpoint** | **tipo de dato** | **direccion** | **utilidad** |
|---|---|---|---|---|
| get | categorias | ""  | /categorias | consultar lista de categorias disponibles|
| get | Catalogo: categorias | String  | ("/catalogo/categorias/:categoria") |buscara en catalogo por categoria|
| get | Catalogo: todos | ""  | ("/catalogo") |para listar el catalogo completo
| get | Catalogo: Titulos | String | ("/catalogo/titulos") | listar todos los titulos disponibles en el catalogo
| get |.Catalogo: idTitulos  | String  | ("/catalogo/titulos/:id") | para filtrar por idTitulos
| get | Catalogo: titulo |  Integer  |("/catalogo/titulo/:titulo") | este endpoint en singular podra listar un titulo determinado que se ingrese en la barra de navegacion
| get | Catalogo: Genero |  ""  |("/catalogo/genero/") | aqui se podran consultar los generos posibles
| get | Catalogo: Genero |  String  |("/catalogo/genero/:genero") | asi se obtendra por resultado todos los titulos disponibles con un genero determinado

## Ejemplos Endpoints
| endpoint | url | dato de ejemplo  | resultado esperado |
|---|---|---|---|
| Categorias | ("/categorias") | ""  | [{"idcategoria": 1,"categoria": "Serie"},{"idcategoria": 2, "categoria":"Película"}]
| Categorias: Categorias | ("/catalogo/categorias/:Categoria") | Serie  | [{"idCatalogo": 13, "titulo": "Anne with an 'E'","resumen": "Ann...}]
| Catalogo: todos | ("/catalogo") | ""  | Catalogo completo con todal de datos disponibles
| Catalogo: Titulos | ("/catalogo/titulos") | ""|listado de todos los titulos disponibles con su idCatalogo
| Catalogo: Titulos | ("/catalogo/titulo/:id") | 33 | listado del titulo cargado bajo el idCatalogo = 33
| Catalogo: Titulo | ("/catalogo/titulo/:titulo") | Avengers: End Game | {"idCatalogo": 8, "titulo": "Avengers: End Game", "resumen": "Después d...}
| Catalogo: Genero | ("/catalogo/genero/") | ""| listado de generos disponibles a consultar
| Catalogo: Genero | ("/catalogo/genero/:genero") | "Accion" | listado de peliculas cuyo genero tenga la palabra accion 
