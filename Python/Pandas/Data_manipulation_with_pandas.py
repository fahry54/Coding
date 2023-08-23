import pandas as pd
# Baca file sample_csv.csv
df = pd.read_csv("https://storage.googleapis.com/dqlab-dataset/sample_csv.csv")
# Set index dari df sesuai instruksi
df = df.set_index(["order_date","order_id","product_id"])
# Slice sesuai intruksi
df_slice = df.loc[("2019-01-01",1612339,["P2154","P2159"]),:]
print("Slice df:\n", df_slice)

import pandas as pd
# Baca file "https://storage.googleapis.com/dqlab-dataset/datacovid19.csv"
df = pd.read_csv("https://storage.googleapis.com/dqlab-dataset/datacovid19.csv")
# Cetak nilai mean dan median awal 
print("Awal: mean = %f, median = %f." % (df["active"].mean(), df["active"].median()))
# Isi missing value kolom active dengan median
df_median = df["active"].fillna(df["active"].median())
# Cetak nilai mean dan median awal setelah diisi dengan median
print("Awal: mean = %f, median = %f." % (df_median.mean(), df_median.median()))
# Isi missing value kolom active dengan mean
df_mean = df["active"].fillna(df["active"].mean())
# Cetak nilai mean dan median awal setelah diisi dengan mean
print("Awal: mean = %f, median = %f." % (df_mean.mean(), df_mean.median()))