{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "metadata": {},
   "outputs": [],
   "source": [
    "import pandas as pd\n",
    "import numpy as np"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "metadata": {},
   "outputs": [],
   "source": [
    "def acquire():\n",
    "    acq = pd.read_csv('/Users/almu/ironhack/datamad0119/module-1/pipelines-project/your-code/data-folder/googleplaystore.csv')\n",
    "    return acq"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "def wrangle(df):\n",
    "    data = df.drop_duplicates()\n",
    "    data=data.drop_duplicates('App', keep=\"last\", inplace=True)\n",
    "    data=data.rename(columns={'Content Rating':'Content_Rating', 'Last Updated':'Last_Updated','Current Ver':'Current_Ver','Android Ver':'Android_Ver'})\n",
    "    data=data.drop('Genres', axis=1)\n",
    "    new = data['Last_Updated'].str.split(\",\", n = 1, expand = True)\n",
    "    data['Updating_Year']=new[1]\n",
    "    data=data.drop('Last_Updated', axis=1)\n",
    "    data['Installs']=data['Installs'].str.replace(\"+\",\"\")\n",
    "    data['Android_Ver']=data['Android_Ver'].str.replace(\" and up\",\"\")\n",
    "    data['Price_dollars']=data['Price_dollars'].str.replace(\"$\",\"\")\n",
    "    data=data.drop(data[data['Reviews']=='3.0M'].index)\n",
    "    data['Reviews']=data['Reviews'].astype(int)\n",
    "    data.loc[:,'Installs'] = data.loc[:,'Installs'].str.replace(',', '', regex=False).astype(int)\n",
    "    return data\n",
    "if __name__ == '__main__':\n",
    "    acq = acquire()\n",
    "    data = wrangle(df)\n",
    "    "
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.7.2"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
