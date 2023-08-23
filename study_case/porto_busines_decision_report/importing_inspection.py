import pandas as pd

df = pd.read_csv('data_retail.csv', sep=';')

print('Lima data teratas:')
print(df.head())

print('\nInfo dataset:')
print(df.info())

print(df['First_Transaction'].head())