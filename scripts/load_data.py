import pandas as pd
import sqlite3
from pathlib import Path

#Create a connection to the SQLite database
ROOT = Path(__file__).resolve().parent.parent
RAW_DIR = ROOT / "data" / "raw"
DB_PATH = ROOT / "db" / "olist.db"
SCHEMA = ROOT / "sql" / "01_schema.sql"

# Define the mapping of CSV filenames to their corresponding table names in the database
TABLES = {
    "olist_customers_dataset.csv": "customers",
    "olist_orders_dataset.csv": "orders",
    "product_category_name_translation.csv": "product_category_translation",
    "olist_products_dataset.csv": "products",
    "olist_sellers_dataset.csv" : "sellers",
    "olist_order_payments_dataset.csv": "order_payments",
    "olist_order_reviews_dataset.csv": "order_reviews",
    "olist_order_items_dataset.csv": "order_items"
}

def main():
    connection = sqlite3.connect(DB_PATH)
    cursor = connection.cursor()

    # Create the database schema
    schema_sql = SCHEMA.read_text()
    cursor.executescript(schema_sql)

    for file_name, table_name in TABLES.items():
        csv_path = RAW_DIR / file_name
        df = pd.read_csv(csv_path)
        df.to_sql(table_name, connection, if_exists='replace', index=False)

    connection.commit()
    connection.close()


if __name__ == "__main__":
    main()