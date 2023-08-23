import pandas as pd
import numpy as np
import pandas_profiling
retail_raw = pd.read_csv('retail_raw_reduced_data_quality.csv')

# Quantile statistics kolom quantity
print('Kolom quantity:')
print(retail_raw['quantity'].quantile([0.25, 0.5, 0.75]))

# Tugas praktek: Quantile statistics kolom item_price
print('')
print('Kolom item_price:')
print(retail_raw['item_price'].quantile([0.25, 0.5, 0.75]))