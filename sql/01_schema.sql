CREATE TABLE customers(
    customer_id TEXT PRIMARY KEY,
    customer_unique_id TEXT NOT NULL,
    customer_zip_code_prefix TEXT NOT NULL,
    customer_city TEXT NOT NULL,
    customer_state TEXT NOT NULL
);

CREATE TABLE sellers(
    seller_id TEXT PRIMARY KEY,
    seller_zip_code_prefix TEXT NOT NULL,
    seller_city TEXT NOT NULL,
    seller_state TEXT NOT NULL
);

CREATE TABLE product_category_translation(
    product_category_name TEXT PRIMARY KEY,
    product_category_name_english TEXT NOT NULL
);