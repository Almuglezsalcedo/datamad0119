

```python
import pandas as pd
import numpy as np
```


```python
data = pd.read_csv('/Users/almu/ironhack/datamad0119/module-1/pandas-project/your-code/sharks.csv')
```


```python
#confirmamos que no hay registros duplicados a priori
before = len(data)
data = data.drop_duplicates()
after = len(data)
before,after
```




    (5992, 5992)




```python

data.columns

```




    Index(['Case Number', 'Date', 'Year', 'Type', 'Country', 'Area', 'Location',
           'Activity', 'Name', 'Sex ', 'Age', 'Injury', 'Fatal (Y/N)', 'Time',
           'Species ', 'Investigator or Source', 'pdf', 'href formula', 'href',
           'Case Number.1', 'Case Number.2', 'original order', 'Unnamed: 22',
           'Unnamed: 23'],
          dtype='object')




```python
#renombramos nombre de columnas
data = data.rename(columns={'Species ':'Species','Sex ': 'Sex', 'Fatal (Y/N)':'Fatal', 'original order': 'Original_order'})
```


```python
data.dtypes
```




    Case Number               object
    Date                      object
    Year                       int64
    Type                      object
    Country                   object
    Area                      object
    Location                  object
    Activity                  object
    Name                      object
    Sex                       object
    Age                       object
    Injury                    object
    Fatal                     object
    Time                      object
    Species                   object
    Investigator or Source    object
    pdf                       object
    href formula              object
    href                      object
    Case Number.1             object
    Case Number.2             object
    Original_order             int64
    Unnamed: 22               object
    Unnamed: 23               object
    dtype: object




```python
#Cleaning. Missing values
null_cols = data.isnull().sum()
null_cols[null_cols > 0]

```




    Country                     43
    Area                       402
    Location                   496
    Activity                   527
    Name                       200
    Sex                        567
    Age                       2681
    Injury                      27
    Fatal                       19
    Time                      3213
    Species                   2934
    Investigator or Source      15
    href formula                 1
    href                         3
    Unnamed: 22               5991
    Unnamed: 23               5990
    dtype: int64




```python
#Cleaning. Missing values. Eliminamos columnas con más de 4000 nulls
drop_cols = list(null_cols[null_cols > 4000].index)
data = data.drop(drop_cols, axis=1)

```


```python
#eliminamos 'case number1' y 'case numer 2' porque no aportan info diferente a la columna de Date

data = data.drop(['Case Number.1','Case Number.2', 'Case Number'], axis=1)
    


```


```python
#eliminamos columnas 'href formula','pdf','href' porque no interesan
drop_cols=['href formula','pdf','href']
data = data.drop(drop_cols, axis=1)
```


```python
#cambiamos orden de columnas
column_order=['Original_order','Date', 'Year', 'Country', 'Area', 'Location','Name', 'Sex', 'Age','Type', 'Activity','Injury', 'Fatal', 'Time', 'Species','Investigator or Source']
data=data[column_order]
data.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Original_order</th>
      <th>Date</th>
      <th>Year</th>
      <th>Country</th>
      <th>Area</th>
      <th>Location</th>
      <th>Name</th>
      <th>Sex</th>
      <th>Age</th>
      <th>Type</th>
      <th>Activity</th>
      <th>Injury</th>
      <th>Fatal</th>
      <th>Time</th>
      <th>Species</th>
      <th>Investigator or Source</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5993</td>
      <td>18-Sep-16</td>
      <td>2016</td>
      <td>USA</td>
      <td>Florida</td>
      <td>New Smyrna Beach, Volusia County</td>
      <td>male</td>
      <td>M</td>
      <td>16</td>
      <td>Unprovoked</td>
      <td>Surfing</td>
      <td>Minor injury to thigh</td>
      <td>N</td>
      <td>13h00</td>
      <td>NaN</td>
      <td>Orlando Sentinel, 9/19/2016</td>
    </tr>
    <tr>
      <th>1</th>
      <td>5992</td>
      <td>18-Sep-16</td>
      <td>2016</td>
      <td>USA</td>
      <td>Florida</td>
      <td>New Smyrna Beach, Volusia County</td>
      <td>Chucky Luciano</td>
      <td>M</td>
      <td>36</td>
      <td>Unprovoked</td>
      <td>Surfing</td>
      <td>Lacerations to hands</td>
      <td>N</td>
      <td>11h00</td>
      <td>NaN</td>
      <td>Orlando Sentinel, 9/19/2016</td>
    </tr>
    <tr>
      <th>2</th>
      <td>5991</td>
      <td>18-Sep-16</td>
      <td>2016</td>
      <td>USA</td>
      <td>Florida</td>
      <td>New Smyrna Beach, Volusia County</td>
      <td>male</td>
      <td>M</td>
      <td>43</td>
      <td>Unprovoked</td>
      <td>Surfing</td>
      <td>Lacerations to lower leg</td>
      <td>N</td>
      <td>10h43</td>
      <td>NaN</td>
      <td>Orlando Sentinel, 9/19/2016</td>
    </tr>
    <tr>
      <th>3</th>
      <td>5990</td>
      <td>17-Sep-16</td>
      <td>2016</td>
      <td>AUSTRALIA</td>
      <td>Victoria</td>
      <td>Thirteenth Beach</td>
      <td>Rory Angiolella</td>
      <td>M</td>
      <td>NaN</td>
      <td>Unprovoked</td>
      <td>Surfing</td>
      <td>Struck by fin on chest &amp; leg</td>
      <td>N</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>The Age, 9/18/2016</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5989</td>
      <td>16-Sep-16</td>
      <td>2016</td>
      <td>AUSTRALIA</td>
      <td>Victoria</td>
      <td>Bells Beach</td>
      <td>male</td>
      <td>M</td>
      <td>NaN</td>
      <td>Unprovoked</td>
      <td>Surfing</td>
      <td>No injury: Knocked off board by shark</td>
      <td>N</td>
      <td>NaN</td>
      <td>2 m shark</td>
      <td>The Age, 9/16/2016</td>
    </tr>
  </tbody>
</table>
</div>




```python
set(data['Year']) #encontramos años con valor 0,55,77,500 
```




    {0,
     5,
     77,
     500,
     1543,
     1554,
     1555,
     1580,
     1595,
     1617,
     1637,
     1638,
     1642,
     1700,
     1703,
     1721,
     1733,
     1738,
     1742,
     1748,
     1749,
     1755,
     1758,
     1764,
     1767,
     1771,
     1776,
     1779,
     1785,
     1787,
     1788,
     1791,
     1800,
     1803,
     1804,
     1805,
     1807,
     1811,
     1812,
     1816,
     1817,
     1818,
     1819,
     1822,
     1825,
     1826,
     1827,
     1828,
     1829,
     1830,
     1831,
     1832,
     1834,
     1835,
     1836,
     1837,
     1839,
     1840,
     1841,
     1842,
     1844,
     1845,
     1846,
     1847,
     1848,
     1849,
     1850,
     1851,
     1852,
     1853,
     1854,
     1855,
     1856,
     1858,
     1859,
     1860,
     1861,
     1862,
     1863,
     1864,
     1865,
     1866,
     1867,
     1868,
     1869,
     1870,
     1871,
     1872,
     1873,
     1874,
     1875,
     1876,
     1877,
     1878,
     1879,
     1880,
     1881,
     1882,
     1883,
     1884,
     1885,
     1886,
     1887,
     1888,
     1889,
     1890,
     1891,
     1892,
     1893,
     1894,
     1895,
     1896,
     1897,
     1898,
     1899,
     1900,
     1901,
     1902,
     1903,
     1904,
     1905,
     1906,
     1907,
     1908,
     1909,
     1910,
     1911,
     1912,
     1913,
     1914,
     1915,
     1916,
     1917,
     1918,
     1919,
     1920,
     1921,
     1922,
     1923,
     1924,
     1925,
     1926,
     1927,
     1928,
     1929,
     1930,
     1931,
     1932,
     1933,
     1934,
     1935,
     1936,
     1937,
     1938,
     1939,
     1940,
     1941,
     1942,
     1943,
     1944,
     1945,
     1946,
     1947,
     1948,
     1949,
     1950,
     1951,
     1952,
     1953,
     1954,
     1955,
     1956,
     1957,
     1958,
     1959,
     1960,
     1961,
     1962,
     1963,
     1964,
     1965,
     1966,
     1967,
     1968,
     1969,
     1970,
     1971,
     1972,
     1973,
     1974,
     1975,
     1976,
     1977,
     1978,
     1979,
     1980,
     1981,
     1982,
     1983,
     1984,
     1985,
     1986,
     1987,
     1988,
     1989,
     1990,
     1991,
     1992,
     1993,
     1994,
     1995,
     1996,
     1997,
     1998,
     1999,
     2000,
     2001,
     2002,
     2003,
     2004,
     2005,
     2006,
     2007,
     2008,
     2009,
     2010,
     2011,
     2012,
     2013,
     2014,
     2015,
     2016}




```python
#eliminamos valores de la columna YEAR (año 5,500 y 77 son raros-no fiables al ser tan antiguos) (año 0 no aportan info).
#las filas que eliminamos solo suponen un 2% del total
#consideramos que no supone un problema de cara a sacar conclusiones sobre la BBDD.Eliminamos
data=data.drop(data[data.Year == 0].index);
data=data.drop(data[data.Year == 5].index);
data=data.drop(data[data.Year == 500].index);
data=data.drop(data[data.Year == 77].index);
```


```python
#Tabla 1: ataques por paises
attacks_per_country = data.groupby(['Country'])['Original_order'].count().reset_index(name='Number_attacks') 
attacks_per_country=attacks_per_country.sort_values(by='Number_attacks', ascending=False)
attacks_per_country=attacks_per_country[:13]
attacks_per_country  #hemos seleccionado aquellos países de mas de 50 ataques
#USA y Australia más ataques con diferencia
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Country</th>
      <th>Number_attacks</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>190</th>
      <td>USA</td>
      <td>2099</td>
    </tr>
    <tr>
      <th>11</th>
      <td>AUSTRALIA</td>
      <td>1262</td>
    </tr>
    <tr>
      <th>158</th>
      <td>SOUTH AFRICA</td>
      <td>557</td>
    </tr>
    <tr>
      <th>136</th>
      <td>PAPUA NEW GUINEA</td>
      <td>129</td>
    </tr>
    <tr>
      <th>118</th>
      <td>NEW ZEALAND</td>
      <td>124</td>
    </tr>
    <tr>
      <th>19</th>
      <td>BRAZIL</td>
      <td>102</td>
    </tr>
    <tr>
      <th>13</th>
      <td>BAHAMAS</td>
      <td>95</td>
    </tr>
    <tr>
      <th>104</th>
      <td>MEXICO</td>
      <td>80</td>
    </tr>
    <tr>
      <th>82</th>
      <td>ITALY</td>
      <td>69</td>
    </tr>
    <tr>
      <th>53</th>
      <td>FIJI</td>
      <td>59</td>
    </tr>
    <tr>
      <th>139</th>
      <td>PHILIPPINES</td>
      <td>59</td>
    </tr>
    <tr>
      <th>144</th>
      <td>REUNION</td>
      <td>55</td>
    </tr>
    <tr>
      <th>116</th>
      <td>NEW CALEDONIA</td>
      <td>51</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Tabla 2: Ataques por año
attacks_per_year = data.groupby(['Year'])['Original_order'].count().reset_index(name='Number_attacks')  
attacks_per_year=attacks_per_year.sort_values(by='Number_attacks', ascending=False)
attacks_per_year=attacks_per_year[:11]
attacks_per_year  #últimos años más ataques pero puede haber una mayor recogida de datos 

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Year</th>
      <th>Number_attacks</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>226</th>
      <td>2015</td>
      <td>139</td>
    </tr>
    <tr>
      <th>222</th>
      <td>2011</td>
      <td>128</td>
    </tr>
    <tr>
      <th>225</th>
      <td>2014</td>
      <td>125</td>
    </tr>
    <tr>
      <th>224</th>
      <td>2013</td>
      <td>122</td>
    </tr>
    <tr>
      <th>219</th>
      <td>2008</td>
      <td>121</td>
    </tr>
    <tr>
      <th>220</th>
      <td>2009</td>
      <td>120</td>
    </tr>
    <tr>
      <th>223</th>
      <td>2012</td>
      <td>117</td>
    </tr>
    <tr>
      <th>218</th>
      <td>2007</td>
      <td>112</td>
    </tr>
    <tr>
      <th>227</th>
      <td>2016</td>
      <td>103</td>
    </tr>
    <tr>
      <th>217</th>
      <td>2006</td>
      <td>103</td>
    </tr>
    <tr>
      <th>216</th>
      <td>2005</td>
      <td>103</td>
    </tr>
  </tbody>
</table>
</div>




```python
#BINS Dangerous area level según los ataques que ha habido
d_labels = ['Very Low', 'Low', 'Moderate', 'High', 'Very High']
bins = pd.qcut(attacks_per_country['Number_attacks'],5, labels=d_labels)
bins.head(13)
```




    190    Very High
    11     Very High
    158    Very High
    136         High
    118         High
    19      Moderate
    13      Moderate
    104     Moderate
    82           Low
    53      Very Low
    139     Very Low
    144     Very Low
    116     Very Low
    Name: Number_attacks, dtype: category
    Categories (5, object): [Very Low < Low < Moderate < High < Very High]




```python
#cambiamos values (Nan, '.', 'N', 'IIi') de columna Sex por 'U' de Unknown...
data[['Sex']] = data[['Sex']].fillna(0)
data['Sex'].value_counts()
```




    M      4732
    F       572
    0       556
    M         2
    N         1
    lli       1
    .         1
    Name: Sex, dtype: int64




```python
#...
vals_to_replace = {'M ': 'M','N':'U' ,'lli': 'U','.': 'U','M':'M','F':'F'}
data['Sex'] = data['Sex'].map(vals_to_replace)

```


```python
#Tabla 3: Ataques por sexo
attacks_per_sex = data.groupby(['Sex'])['Original_order'].count().reset_index(name='Number_attacks')  
attacks_per_sex=attacks_per_sex.sort_values(by='Number_attacks', ascending=False)
attacks_per_sex=attacks_per_sex[:11]
attacks_per_sex
 
#mayoría de ataques fueron a hombres
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Sex</th>
      <th>Number_attacks</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>M</td>
      <td>4734</td>
    </tr>
    <tr>
      <th>0</th>
      <td>F</td>
      <td>572</td>
    </tr>
    <tr>
      <th>2</th>
      <td>U</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>




```python
#filtramos por Australia y USA ya que son los countries con más ataques y filtramos a partir de 2005 por el mismo motivo
Australia = data[(data['Country']=='AUSTRALIA')&(data['Year']>=2005)]
USA = data[(data['Country']=='USA')&(data['Year']>=2005)]

```


```python
#Combinamos dataFrames de Australia y USA mediante "concat"
frames=[Australia,USA]
Aus_USA=pd.concat(frames)
```


```python
Aus_USA_areas= Aus_USA.groupby(['Country','Area','Fatal']).Original_order.count().reset_index(name='Number_attacks')
vals_to_replace = {'UNKNOWN': '?','Y':'Y','N':'N'}
Aus_USA_areas['Fatal'] = Aus_USA_areas['Fatal'].map(vals_to_replace)
Aus_USA_areas
Aus_USA_areas=Aus_USA_areas.sort_values(by='Number_attacks', ascending=False)
Aus_USA_areas
#Florida (USA) y New South Wales(Aus) son los lugares donde más ataques ha habido pero ninguno de esos ataques ha sido mortal.
# el lugar donde más ataques mortales ha habido (de USA o AUS) es Western Australia con 15 ataques mortales

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Country</th>
      <th>Area</th>
      <th>Fatal</th>
      <th>Number_attacks</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>20</th>
      <td>USA</td>
      <td>Florida</td>
      <td>N</td>
      <td>331</td>
    </tr>
    <tr>
      <th>0</th>
      <td>AUSTRALIA</td>
      <td>New South Wales</td>
      <td>N</td>
      <td>105</td>
    </tr>
    <tr>
      <th>24</th>
      <td>USA</td>
      <td>Hawaii</td>
      <td>N</td>
      <td>87</td>
    </tr>
    <tr>
      <th>17</th>
      <td>USA</td>
      <td>California</td>
      <td>N</td>
      <td>79</td>
    </tr>
    <tr>
      <th>40</th>
      <td>USA</td>
      <td>South Carolina</td>
      <td>N</td>
      <td>53</td>
    </tr>
    <tr>
      <th>14</th>
      <td>AUSTRALIA</td>
      <td>Western Australia</td>
      <td>N</td>
      <td>45</td>
    </tr>
    <tr>
      <th>34</th>
      <td>USA</td>
      <td>North Carolina</td>
      <td>N</td>
      <td>44</td>
    </tr>
    <tr>
      <th>4</th>
      <td>AUSTRALIA</td>
      <td>Queensland</td>
      <td>N</td>
      <td>36</td>
    </tr>
    <tr>
      <th>12</th>
      <td>AUSTRALIA</td>
      <td>Victoria</td>
      <td>N</td>
      <td>20</td>
    </tr>
    <tr>
      <th>43</th>
      <td>USA</td>
      <td>Texas</td>
      <td>N</td>
      <td>20</td>
    </tr>
    <tr>
      <th>6</th>
      <td>AUSTRALIA</td>
      <td>South Australia</td>
      <td>N</td>
      <td>16</td>
    </tr>
    <tr>
      <th>15</th>
      <td>AUSTRALIA</td>
      <td>Western Australia</td>
      <td>Y</td>
      <td>15</td>
    </tr>
    <tr>
      <th>36</th>
      <td>USA</td>
      <td>Oregon</td>
      <td>N</td>
      <td>11</td>
    </tr>
    <tr>
      <th>2</th>
      <td>AUSTRALIA</td>
      <td>New South Wales</td>
      <td>Y</td>
      <td>7</td>
    </tr>
    <tr>
      <th>25</th>
      <td>USA</td>
      <td>Hawaii</td>
      <td>Y</td>
      <td>6</td>
    </tr>
    <tr>
      <th>8</th>
      <td>AUSTRALIA</td>
      <td>Tasmania</td>
      <td>N</td>
      <td>5</td>
    </tr>
    <tr>
      <th>16</th>
      <td>USA</td>
      <td>Alabama</td>
      <td>N</td>
      <td>5</td>
    </tr>
    <tr>
      <th>5</th>
      <td>AUSTRALIA</td>
      <td>Queensland</td>
      <td>Y</td>
      <td>5</td>
    </tr>
    <tr>
      <th>21</th>
      <td>USA</td>
      <td>Florida</td>
      <td>Y</td>
      <td>4</td>
    </tr>
    <tr>
      <th>31</th>
      <td>USA</td>
      <td>New Jersey</td>
      <td>N</td>
      <td>4</td>
    </tr>
    <tr>
      <th>18</th>
      <td>USA</td>
      <td>California</td>
      <td>Y</td>
      <td>4</td>
    </tr>
    <tr>
      <th>30</th>
      <td>USA</td>
      <td>Massachusetts</td>
      <td>N</td>
      <td>3</td>
    </tr>
    <tr>
      <th>7</th>
      <td>AUSTRALIA</td>
      <td>South Australia</td>
      <td>Y</td>
      <td>3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>AUSTRALIA</td>
      <td>Northern Territory</td>
      <td>N</td>
      <td>3</td>
    </tr>
    <tr>
      <th>38</th>
      <td>USA</td>
      <td>Puerto Rico</td>
      <td>N</td>
      <td>2</td>
    </tr>
    <tr>
      <th>33</th>
      <td>USA</td>
      <td>New York</td>
      <td>N</td>
      <td>2</td>
    </tr>
    <tr>
      <th>37</th>
      <td>USA</td>
      <td>Palmyra Atoll</td>
      <td>N</td>
      <td>2</td>
    </tr>
    <tr>
      <th>45</th>
      <td>USA</td>
      <td>Virginia</td>
      <td>N</td>
      <td>2</td>
    </tr>
    <tr>
      <th>11</th>
      <td>AUSTRALIA</td>
      <td>Torres Strait</td>
      <td>N</td>
      <td>2</td>
    </tr>
    <tr>
      <th>27</th>
      <td>USA</td>
      <td>Louisiana</td>
      <td>N</td>
      <td>2</td>
    </tr>
    <tr>
      <th>19</th>
      <td>USA</td>
      <td>Delaware</td>
      <td>N</td>
      <td>2</td>
    </tr>
    <tr>
      <th>28</th>
      <td>USA</td>
      <td>Maine</td>
      <td>N</td>
      <td>1</td>
    </tr>
    <tr>
      <th>44</th>
      <td>USA</td>
      <td>US Virgin Islands</td>
      <td>N</td>
      <td>1</td>
    </tr>
    <tr>
      <th>9</th>
      <td>AUSTRALIA</td>
      <td>Tasmania</td>
      <td>Y</td>
      <td>1</td>
    </tr>
    <tr>
      <th>42</th>
      <td>USA</td>
      <td>South Carolina</td>
      <td>Y</td>
      <td>1</td>
    </tr>
    <tr>
      <th>41</th>
      <td>USA</td>
      <td>South Carolina</td>
      <td>?</td>
      <td>1</td>
    </tr>
    <tr>
      <th>10</th>
      <td>AUSTRALIA</td>
      <td>Territory of Cocos (Keeling) Islands</td>
      <td>N</td>
      <td>1</td>
    </tr>
    <tr>
      <th>39</th>
      <td>USA</td>
      <td>Puerto Rico</td>
      <td>Y</td>
      <td>1</td>
    </tr>
    <tr>
      <th>13</th>
      <td>AUSTRALIA</td>
      <td>Victoria</td>
      <td>Y</td>
      <td>1</td>
    </tr>
    <tr>
      <th>29</th>
      <td>USA</td>
      <td>Maryland</td>
      <td>N</td>
      <td>1</td>
    </tr>
    <tr>
      <th>35</th>
      <td>USA</td>
      <td>North Carolina</td>
      <td>Y</td>
      <td>1</td>
    </tr>
    <tr>
      <th>22</th>
      <td>USA</td>
      <td>Georgia</td>
      <td>N</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>AUSTRALIA</td>
      <td>New South Wales</td>
      <td>?</td>
      <td>1</td>
    </tr>
    <tr>
      <th>32</th>
      <td>USA</td>
      <td>New Mexico</td>
      <td>N</td>
      <td>1</td>
    </tr>
    <tr>
      <th>26</th>
      <td>USA</td>
      <td>Kentucky</td>
      <td>N</td>
      <td>1</td>
    </tr>
    <tr>
      <th>23</th>
      <td>USA</td>
      <td>Guam</td>
      <td>N</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
data.Activity.value_counts()
```




    Surfing                                             903
    Swimming                                            804
    Fishing                                             407
    Spearfishing                                        321
    Bathing                                             150
    Wading                                              142
    Diving                                              111
    Standing                                             95
    Snorkeling                                           76
    Scuba diving                                         73
    Body boarding                                        54
    Body surfing                                         48
    Swimming                                             47
    Treading water                                       32
    Boogie boarding                                      28
    Kayaking                                             28
    Pearl diving                                         28
    Free diving                                          24
    Fell overboard                                       21
    Windsurfing                                          18
    Boogie Boarding                                      16
    Shark fishing                                        15
    Walking                                              15
    Floating                                             12
    Surf skiing                                          12
    Fishing                                              12
    Rowing                                               12
    Surf-skiing                                          12
    Fishing for sharks                                   11
    Surf fishing                                         11
                                                       ... 
    Cleaning a tank                                       1
    Diving in tuna net                                    1
    Pleasure boating                                      1
    Swimming with dolphins                                1
    Stamding                                              1
    Diving for pearls                                     1
    Spearfishing, had fish on his spear                   1
    Towing rubber dinghy                                  1
    Slipped off rocks and fell into the water             1
    Attempting to fix motor                               1
    Boogie boarding or Surfing                            1
    Wading / fishing & carrying a bag of fish             1
    Windsurfing (urinating on his board)                  1
    Fishing - 'tag & release'                             1
    Diving for pearl shell                                1
    Schooner sank during a storm                          1
    Tandem surfing                                        1
    Standing, stepped on shark                            1
    Diving off pier & treading water                      1
    Fell overboard from sponge vessel                     1
    Swimming after a tennis ball                          1
    Arsinoe, a French tanker                              1
    63' fishing boat Sno' Bay foundered                   1
    Swimming underneath house on pilings                  1
    Chumming for sharks                                   1
    Commercial spearfishing                               1
    Hookah diving for abalone (submerged)                 1
    Fishing (rod & line)                                  1
    Lying on the bottom of a 16' dinghy                   1
    Rescuing seaman after ship sunk by German raider      1
    Name: Activity, Length: 1453, dtype: int64


