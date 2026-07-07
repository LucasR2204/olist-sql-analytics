SELECT 
    product_category_translation.product_category_name_english,
    SUM(price) AS total_revenue
FROM order_items

JOIN products ON order_items.product_id = products.product_id
JOIN product_category_translation ON products.product_category_name = product_category_translation.product_category_name

GROUP BY product_category_translation.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;

WITH cte_state_price_rank AS (
    
    SELECT 
        sellers.seller_state,
        sellers.seller_id,
        SUM(price) as total_revenue
    from sellers

    JOIN order_items ON sellers.seller_id = order_items.seller_id

    GROUP BY sellers.seller_id , sellers.seller_state


)
SELECT
    *
    RANK() OVER (PARTITION BY seller_state,seller_id,total_revenue ORDER BY total_revenue DESC) AS revenue_rank
FROM cte_state_price_rank
ORDER BY revenue_rank, seller_state
