
# Web Project


## 1. Web scraping

### La página que utilicé es una web de música que tiene informacíon sobre diferentes artistas y que se encuentra dividida entre otras cosas por género. Para sacar la información creé varias funciones: 

### 1. para realizar las peticiones request

### 2. para limpiar la información ya que había saltos de página, necesitaba que si el artista estaba separado por espacios, estos se reemplazaran con el signo + y estuvieran en minúsculas para poder usarlos posteriormente con la api.

### 3. para crear una lista donde se fueran agregando todos los artistas.

### Finalmente con un loop realicé todas las peticiones. Usé una url para cada género de música, 20 en total, y conseguí un listado con 1065 artistas aprox. 


## 2. API

### La API que utilicé fue Itunes Search Api. 

### EL obejetivo era con la lista de artistas que había conseguido haciendo web scraping, hacer una dataframe con informacion adicional de cada artista proporcionada por la api. 

### Para ello creé dos peticiones, solicitándole información de los artistas en dos bloques de 0-500 y 500-1000 y en esa misma petición especifiqué los campos que necesitaba: album, canción, precio del album, etc. 

### La información que recibía en forma de tupla la fui guardando en una lista mediante un try and catch por si en el caso de que no encontrara datos de un artista, pasara al siguiente y no diera error. 


## 3. DataFrame

### Con la información obtenida creé un DataFrame convirtiendo la lista de tuplas obtenida en el paso anterior en un df.


## 4. Exportación a fichero Jason

### Exporté df a fichero Json



### Enlace página web: 

#### https://www.allmusic.com/



### Enlace api:

#### https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/
