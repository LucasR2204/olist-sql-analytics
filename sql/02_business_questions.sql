SELECT product_category_translation.product_category_name_english, SUM(price) AS total_revenue
FROM order_items

JOIN products ON order_items.product_id = products.product_id
JOIN product_category_translation ON products.product_category_name = product_category_translation.product_category_name

GROUP BY product_category_translation.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;