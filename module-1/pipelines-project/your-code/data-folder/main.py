
# coding: utf-8

# ### 1. ACQUISITION

# In[2]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


# In[3]:


data=pd.read_csv('/Users/almu/ironhack/datamad0119/module-1/pipelines-project/your-code/data-folder/googleplaystore.csv')


# ## 2. WRANGLING

# In[4]:



data = data.drop_duplicates()
data.drop_duplicates('App', keep="last", inplace=True)
data=data.rename(columns={'Price':'Price_dollars','Content Rating':'Content_Rating', 'Last Updated':'Last_Updated','Current Ver':'Current_Ver','Android Ver':'Android_Ver'})
data=data.drop('Genres', axis=1)
new = data['Last_Updated'].str.split(",", n = 1, expand = True)
data['Updating_Year']=new[1]
data=data.drop('Last_Updated', axis=1)
data['Installs']=data['Installs'].str.replace("+","")
data['Android_Ver']=data['Android_Ver'].str.replace(" and up","")
data['Price_dollars']=data['Price_dollars'].str.replace("$","")
data=data.drop(data[data['Reviews']=='3.0M'].index)
data.loc[:,'Installs'] = data.loc[:,'Installs'].str.replace(',', '', regex=False).astype(int)
data['Reviews']=data['Reviews'].astype(int)
data['Updating_Year']=data['Updating_Year'].astype(int)
data['Price_dollars']=data['Price_dollars'].astype(float)


# ## 3. ANALYSIS

# In[5]:


data.head()


# ### H1: las aplicaciones gratis son las que tienen más reviews y un mayor número de instalaciones 

# In[6]:


H1=pd.pivot_table(data,values=['Reviews','Installs'], index='Type',aggfunc={'Reviews':'mean', 'Installs':'mean'})
H1


# ### H2: las apps de comunicación y juegos son las que más se instalan

# In[7]:


H2=pd.pivot_table(data,values=['Installs'], index='Category',aggfunc='sum')
H2=H2.sort_values(by='Installs', ascending=False)
H2.head(2)


# ### H3: las apps con actualizaciones recientes son las que más se instalan. No concluyente

# In[14]:


correlation=data['Installs'].corr(data['Updating_Year'])
correlation


# ### H4: Instagram, Whatsapp y Fb. Top 3 apps gratis mejores valoradas > 5m de reviews 

# In[15]:


H4=data[(data['Reviews']>50000000)&(data['Type']=='Free')].sort_values(by='Rating', ascending=False).head(3)
H4


# ### H5: la mayoría de apss tienen un rating entre 4 y 5

# In[16]:


bins = [0, 1, 2,3,4,5]
data['binned'] = pd.cut(data['Rating'],bins)
H5=pd.pivot_table(data,values='App', index='binned',columns='Type',aggfunc='count').sort_values(by=('Free'), ascending=False).sort_values(by=('Paid'), ascending=False).head(5)
H5


# ### H6: el precio no afecta al Rating. 

# In[17]:


correlation=data['Price_dollars'].corr(data['Rating'])
correlation


# In[46]:



data2=data[(data['Type']=='Paid')]
data3=data[(data['Type']=='Free')]


# In[44]:


data2['Rating'].plot.hist()


# In[47]:


data3['Rating'].plot.hist()


# In[18]:


data['Price_dollars'].describe()


# In[25]:


from seaborn import kdeplot
kdeplot(data.Price_dollars)

