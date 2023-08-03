import pandas as pd
import numpy as np
import io

retail_raw = pd.read_csv('retail_raw_reduced_data_quality.csv')

print(retail_raw.info())
# Kolom city
length_city = len(retail_raw['city'])
count_city = retail_raw['city'].count()
print(length_city)
print(count_city)
# Kolom product id
length_product_id = len(retail_raw['product_id'])
count_product_id = retail_raw['product_id'].count()

# Missing value pada kolom city
number_of_missing_values_city = length_city - count_city
ratio_of_missing_values_city = number_of_missing_values_city/length_city
pct_of_missing_values_city = '{0:.2f}%'. format(ratio_of_missing_values_city*100)
print('Persentase missing value kolom city:', pct_of_missing_values_city)

# Tugas praktek: Missing value pada kolom product_id
number_of_missing_values_product_id = length_product_id - count_product_id
ratio_of_missing_values_product_id = number_of_missing_values_product_id/length_product_id
pct_of_missing_values_product_id = '{0:.2f}%'.format(ratio_of_missing_values_product_id * 100)
print('Persentase missing value kolom product_id:', pct_of_missing_values_product_id)