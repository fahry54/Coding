import pandas as pd
dataset = pd.read_csv('online_raw.csv')

dataset_corr = dataset.corr()
print('Korelasi dataset:\n', dataset.corr())
print('Distribusi Label (Revenue):\n', dataset['Revenue'].value_counts())
# Tugas praktek
print('Korelasi BounceRates-ExitRates:', dataset_corr.loc['BounceRates', 'ExitRates'])
print('Korelasi Revenue-PageValues:', dataset_corr.loc['Revenue','PageValues'])
print('Korelasi TrafficType-Weekend:', dataset_corr.loc['TrafficType','Weekend'])