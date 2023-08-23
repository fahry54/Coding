import pandas as pd
df = pd.read_csv('https://storage.googleapis.com/dqlab-dataset/data_retail.csv', sep=';')
df['First_Transaction'] = pd.to_datetime(df['First_Transaction']/1000, unit='s', origin='1970-01-01')
df['Last_Transaction'] = pd.to_datetime(df['Last_Transaction']/1000, unit='s', origin='1970-01-01')
df['Year_First_Transaction'] = df['First_Transaction'].dt.year
df['Year_Last_Transaction'] = df['Last_Transaction'].dt.year
df.loc[df['Last_Transaction'] <= '2018-08-01', 'is_churn'] = True 
df.loc[df['Last_Transaction'] > '2018-08-01', 'is_churn'] = False 

import matplotlib.pyplot as plt

plt.clf()
# Kategorisasi rata-rata besar transaksi
def f(row):
    if (row['___'] >= ___ and ___['___'] <=___):
        val ='1. 100.000 - 250.000'
    elif (___):
        val ='___'
    elif (___):
        ___
    elif (___):
        ___
    elif (___):
        ___
    elif (___):
        ___
    elif (___):
        ___
    else:
        ___
    return ___
# Tambahkan kolom baru
df['___'] = df.___(___, axis=1)

df_year = df.___(['___'])['___'].___
df_year.___(x='___', y='___', kind='___', title='___')
plt.xlabel('___')
plt.ylabel('___')
plt.tight_layout()
___