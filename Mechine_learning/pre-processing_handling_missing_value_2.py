import pandas as pd
dataset = pd.read_csv('online_raw.csv')

#Drop rows with missing value   
dataset_clean = dataset.dropna() 
print('Ukuran dataset_clean:', dataset_clean.shape) 