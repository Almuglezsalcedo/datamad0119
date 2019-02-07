import pandas as pd
import numpy as np
def acquire():
    acq = pd.read_csv('/Users/almu/ironhack/datamad0119/module-1/pipelines-project/your-code/data-folder/googleplaystore.csv')
    return acq
def wrangle(df):
    data = df.drop_duplicates()
    data=data.drop_duplicates('App', keep="last", inplace=True)
    data=data.rename(columns={'Content Rating':'Content_Rating', 'Last Updated':'Last_Updated','Current Ver':'Current_Ver','Android Ver':'Android_Ver'})
    data=data.drop('Genres', axis=1)
    new = data['Last_Updated'].str.split(",", n = 1, expand = True)
    data['Updating_Year']=new[1]
    data=data.drop('Last_Updated', axis=1)
    data['Installs']=data['Installs'].str.replace("+","")
    data['Android_Ver']=data['Android_Ver'].str.replace(" and up","")
    data['Price_dollars']=data['Price_dollars'].str.replace("$","")
    data=data.drop(data[data['Reviews']=='3.0M'].index)
    data['Reviews']=data['Reviews'].astype(int)
    data.loc[:,'Installs'] = data.loc[:,'Installs'].str.replace(',', '', regex=False).astype(int)
    return data
if __name__ == '__main__':
    acq = acquire()
    data = wrangle(df)
