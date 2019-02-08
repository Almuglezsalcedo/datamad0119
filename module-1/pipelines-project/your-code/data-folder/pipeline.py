
# coding: utf-8

# In[4]:


import pandas as pd
import numpy as np


# In[5]:


def acquire():
    acq=pd.read_csv('/Users/almu/ironhack/datamad0119/module-1/pipelines-project/your-code/data-folder/googleplaystore.csv')
    return acq


# In[6]:


def wrangle(acq):
    
    data = acq.drop_duplicates()
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
    return data


def analyze1 (data):
    H1=pd.pivot_table(data,values=['Reviews','Installs'], index='Type',aggfunc={'Reviews':'mean', 'Installs':'mean'})
    H2=pd.pivot_table(data,values=['Installs'], index='Category',aggfunc='sum')
    H2=H2.sort_values(by='Installs', ascending=False)
    H2=H2.head(2)
    correlation=data['Installs'].corr(data['Updating_Year'])
    correlation
    H4=data[(data['Reviews']>50000000)&(data['Type']=='Free')].sort_values(by='Rating', ascending=False).head(3)
    H4
    bins = [0, 1, 2,3,4,5]
    data['binned'] = pd.cut(data['Rating'],bins)
    H5=pd.pivot_table(data,values='App', index='binned',columns='Type',aggfunc='count').sort_values(by=('Free'), ascending=False).sort_values(by=('Paid'), ascending=False).head(5)
    H5
    correlation=data['Price_dollars'].corr(data['Rating'])
    correlation
    data['Price_dollars'].describe()
    return (H1,H2,correlation,H4,H5)
    
def visualize(data):
    
    
if __name__ == '__main__':
    acq = acquire()
    data = wrangle(acq)
    results=analyze1 (data)
    print('hola')

