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

CREATE TABLE products(
    product_id TEXT PRIMARY KEY,
    product_category_name TEXT NOT NULL,
    product_name_lenght INT NOT NULL,
    product_description_lenght INT NOT NULL,
    product_photos_qty INT NOT NULL,
    product_weight_g FLOAT NOT NULL,
    product_length_cm FLOAT NOT NULL,
    product_height_cm FLOAT NOT NULL,
    product_width_cm FLOAT NOT NULL,
    FOREIGN KEY (product_category_name) REFERENCES product_category_translation (product_category_name)
);