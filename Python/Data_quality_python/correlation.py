import pandas as pd
import numpy as np

retail_raw = pd.read_csv('retail_raw_reduced_data_quality.csv')

print('Korelasi quantity dengan item_price')
print(retail_raw[['quantity', 'item_price']].corr())