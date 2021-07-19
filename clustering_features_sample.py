import pandas as pd

# Read all input datasets

df_sales = pd.read_csv('./../data/clustering_sales.csv')
df_customer = pd.read_csv('./../data/clustering_customer.csv')
df_product = pd.read_csv('./../data/clustering_product.csv')
df_payment = pd.read_csv('./../data/clustering_payment.csv')

# Overall level features

# merge datasets
df_sales = df_sales.merge(df_product[['product_id','category']], on=['product_id'])
df_sales = df_sales.merge(df_payment, on=['payment_type_id'])

# aggregate
df_features_overall = df_sales.groupby(['customer_id']).agg({
    'dollars':'sum',
    'qty':'sum',
    'order_id':'nunique',
    'product_id':'nunique',
    'payment_type_id':'nunique',
    'category':'nunique'
    })

# derived features
df_features_overall['aov'] = df_features_overall['dollars']/df_features_overall['order_id']
df_features_overall['aur'] = df_features_overall['dollars']/df_features_overall['qty']
df_features_overall['upt'] = df_features_overall['qty']/df_features_overall['order_id']

# rename columns
df_features_overall.columns = [
    'sales','units','orders','unique_products_bought','unique_payments_used',
    'unique_categories_bought','aov','aur','upt']