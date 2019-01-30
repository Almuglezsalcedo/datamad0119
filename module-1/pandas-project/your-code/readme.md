
PASOS SEGUIDOS:

1. Hemos importado Pandas y Numpy
2. Importado archivo CSV
3. Confirmamos que no hay registros duplicados
4. Renombramos varias columnas
5. Eliminamos columnas con demasiados null values
6. Eliminamos otras columnas que consideramos no aportan demasiada información
7. Cambiamos el orden de las columnas según nuestra preferencia
8. En la columna Year encontramos valores '0,55,77,500'. eliminamos las filas que contienen esos años
9. Obtenemos tabla de ataques por países
10. Obtenemos tabla de ataques por año
11. Intento de bins en función del peligro por área
12. Unificamos valores de columna sex
13. Obtenemos tabla ataques por sexo
14. Nos centramos en AUS y USA.
16. Filtramos por Australia y año> 2005 ya que junto con USA son los 'countries' y 'year' donde más ataques se ha producido
17. Filtramos por USA y año> 2005 ya que junto con AUS son los 'countries' y 'year' donde más ataques se ha producido
18. Combinamos DataFrames de AUS y USA mediante 'concat'
19. Agrupamos Aus_USA por country,area y fatal



    