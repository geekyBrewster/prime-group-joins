-- 0. Get all the users
SELECT * FROM customers;

-- 1. Get all customers and their addresses
SELECT * FROM customers JOIN addresses
ON customers.id = addresses.customer_id;

-- 2. Get all orders and their line items
SELECT * FROM orders JOIN line_items
ON orders.id = line_items.order_id;

-- 3. Which warehouses have Cheetos?
SELECT warehouse.warehouse, products.description
FROM products JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse.id = warehouse_product.warehouse_id
WHERE products.description ILIKE 'cheetos';

-- 4. Which warehouses have Diet Pepsi?
SELECT warehouse.warehouse, products.description
FROM products JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse.id = warehouse_product.warehouse_id
WHERE products.description ILIKE 'diet pepsi';

-- 5. Get the number of orders for each customer
-- ???????

-- 6. How many customers do we have?
SELECT count(customers.id) FROM customers;

-- 7. How many products do we carry?
SELECT count(products.id) FROM products;

-- 8. What is the total available on-hand quantity of Diet Pepsi?
SELECT sum(warehouse_product.on_hand) FROM warehouse_product
WHERE warehouse_product.product_id = 6;
