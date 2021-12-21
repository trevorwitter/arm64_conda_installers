import time


def main():
    import numpy as np
    import pandas as pd
    from sklearn.datasets import fetch_california_housing
    from sklearn.base import BaseEstimator, TransformerMixin
    from sklearn.model_selection import train_test_split, cross_val_score, GridSearchCV
    from sklearn.pipeline import Pipeline, FeatureUnion
    from sklearn.preprocessing import PolynomialFeatures, StandardScaler, MinMaxScaler
    from sklearn.feature_selection import SelectKBest, chi2
    from sklearn.ensemble import RandomForestRegressor
    from sklearn.metrics import mean_squared_error

    # Get sample dataset
    data = fetch_california_housing()
    X = pd.DataFrame(data['data'],columns=data['feature_names'])
    y = data['target']
    feats = data['feature_names']

    # Split train and test sets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    
    # Preprocessing: select features, scale features, generate polynomial features
    class DataFrameSelector(BaseEstimator, TransformerMixin):
        def __init__(self, attribute_names):
            self.attribute_names = attribute_names
        def fit(self, X, y=None):
            return self
        def transform(self, X):
            return X[self.attribute_names].values

    pipe = Pipeline([
        ('df_selector',DataFrameSelector(feats)), 
        ('Normalizer', MinMaxScaler(feature_range=(0,1))),
        ('poly',PolynomialFeatures(2)),
    ])

    X_trans = pipe.fit_transform(X_train)

    # Train Model
    forest_reg = RandomForestRegressor(n_estimators=100, random_state=42)
    forest_reg.fit(X_trans, y_train)

    # Score on test set
    X_test_transformed = pipe.transform(X_test)
    y_pred = forest_reg.predict(X_test_transformed)
    mse = mean_squared_error(y_test,y_pred)
    print(f"test set mean squared error: {mse}")

if __name__=="__main__":
    start = time.time()
    main()
    runtime = time.time() - start 
    print(f"Runtime: {runtime}")