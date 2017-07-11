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
SELECT customers.first_name, count(orders.address_id) FROM orders
JOIN addresses ON addresses.id = orders.address_id
JOIN customers ON customers.id = addresses.customer_id
GROUP BY customers.first_name;
-- First, we joined the addresses w/ orders tables
-- Second, we joined on the customers table == Building the overall table that we had to count from
-- Next, figured we wanted to select by customer name (used first name)
-- Counting by address for each person
-- Grouped by first name (or what we're selecting by)

-- 6. How many customers do we have?
SELECT count(customers.id) FROM customers;

-- 7. How many products do we carry?
SELECT count(products.id) FROM products;

-- 8. What is the total available on-hand quantity of Diet Pepsi?
SELECT sum(warehouse_product.on_hand) FROM warehouse_product
WHERE warehouse_product.product_id = 6;
