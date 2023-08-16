import pandas as pd
dataset = pd.read_csv('online_raw.csv')
dataset.fillna(dataset.mean(), inplace = True)

from sklearn.preprocessing import LabelEncoder
LE = LabelEncoder()
dataset['Month'] = LE.fit_transform(dataset['Month'])
LE = LabelEncoder()
dataset['VisitorType'] = LE.fit_transform(dataset['VisitorType'])

# removing the target column Revenue from dataset and assigning to X
X = dataset.drop(['Revenue'], axis =1)
# assigning the target column Revenue to y
Y = dataset['Revenue']
# checking the shapes
print("Shape of X:", X.shape)
print("Shape of Y:", Y.shape)