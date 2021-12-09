-- TODO: what's this?
/*SELECT t1.attr1
FROM table1 as t1
         LEFT JOIN table2 as t2 ON t1.attr2=t2.attr1
WHERE t1.attr3=1*/

-- list all contracts between a certain manager and a certain supplier
select tagms.contract.* from tagms.contract inner join tagms.employee on
        tagms.contract.employee_id=tagms.employee.tax_number inner join tagms.supplier on
        tagms.contract.supplier_id=tagms.supplier.vat_number where tagms.employee.first_name='Adam' and
        tagms.supplier.supplier_name='Reg s.r.l.';



-- list all outbound transactions sorted from most to least amount of money:
select tagms.order.* from tagms.order order by tagms.order.net_price DESC;

-- list all inbound transactions sorted from most to least amount of money:
select tagms.specify.* from tagms.specify order by tagms.specify.price DESC;

-- store all the details of the employees,suppliers and customers in the organization:
select tagms.employee.*, tagms.department.name from tagms.employee inner join tagms.work on
        tagms.employee.tax_number=tagms.work.employee_id inner join tagms.department on
        tagms.work.department_id=tagms.department.department_id where tagms.employee.still_working=TRUE;






-- After inserting a new lot with identifier Lot_id (see the previous chapter)
-- decrease the quantity of the items involved in a product of a lot

/*
-- Old query: works only for products
UPDATE tagms.item AS i SET
    quantity = c.quantity
FROM (
    SELECT i.item_id, i.quantity - l.product_quantity * m1.quantity AS quantity FROM tagms.lot AS l
        INNER JOIN tagms.made_up_of_1 AS m1 ON l.product_id = m1.product_id
        INNER JOIN tagms.item AS i ON m1.item_id = i.item_id
    WHERE l.lot_id = '1'
     )
    AS c(item_id, quantity)
WHERE c.item_id = i.item_id;
*/

-- TODO: this should work also for packages. MUST BE TESTED

UPDATE tagms.item AS i SET
    quantity = c.quantity
FROM (
    SELECT i.item_id, i.quantity - l.product_quantity * m1.quantity AS quantity FROM tagms.lot AS l
        INNER JOIN tagms.made_up_of_1 AS m1 ON l.product_id = m1.product_id
        INNER JOIN tagms.item AS i ON m1.item_id = i.item_id
    WHERE l.lot_id = '3'
    UNION
    SELECT i.item_id, i.quantity - l.package_quantity * m2.quantity AS quantity FROM tagms.lot AS l
        INNER JOIN tagms.made_up_of_2 AS m2 ON l.package_id = m2.package_id
        INNER JOIN tagms.item AS i ON m2.item_id = i.item_id
    WHERE l.lot_id = '3'
    ORDER BY item_id ASC
     )
         AS c(item_id, quantity)
WHERE c.item_id = i.item_id
RETURNING i.item_id, name, description, i.quantity, minimum_quantity, item_category_id;





-- After inserting a new contract with identifier Contract_id,
-- in the delivery date the quantities of items in stock must be incremented

UPDATE tagms.item AS i SET
    quantity = c.quantity
FROM (
    SELECT i.item_id, i.quantity + s.purchased_quantity AS quantity FROM tagms.contract AS c
        INNER JOIN tagms.specify AS s ON c.contract_id = s.contract_id
        INNER JOIN tagms.item AS i ON s.item_id = i.item_id
    WHERE c.contract_id = '4'
     )
     AS c(item_id, quantity)
WHERE c.item_id = i.item_id
RETURNING i.item_id, name, description, i.quantity, minimum_quantity, item_category_id;




-- Lists all available (unsold and that won't expire in 6 months) lots stocking
-- a particular product with Product_id identifier,
-- sorted by expiration date (oldest lots must be sold first).


SELECT l.lot_id,
       DATE(l.expiration_date) AS expiration_date,
       l.product_id,
       l.product_quantity,
       ROUND(l.lot_price * (1 + l.vat/100) * (1 - l.lot_discount/100), 2) AS gross_price
FROM tagms.lot AS l
    LEFT OUTER JOIN tagms.draws_from AS df ON l.lot_id = df.lot_id
WHERE l.product_id = '7'
  AND l.expiration_date > (current_date + interval '6 months')
ORDER BY l.expiration_date ASC;



-- TODO: We can put the results of these select inside a unice table and the make some operation between these 3 diferent rows
-- Get the net sales and taxes paid
SELECT SUM(o.net_price) AS net_sales, SUM(o.taxes) AS taxes FROM tagms.order AS o
    WHERE DATE(o.order_date) >= '2021-01-01' AND
          DATE(o.order_date) <= '2021-12-31' AND
          o.order_paid = TRUE;

-- Get the cost of materials
SELECT SUM(sp.price) AS cost_of_material FROM tagms.specify as sp
    INNER JOIN tagms.contract AS c ON c.contract_id = sp.contract_id
WHERE DATE(c.contract_date) >= '2021-01-01' AND DATE(c.contract_date) <= '2021-12-31';

-- Get the production cost
SELECT SUM(p.production_cost * l.product_quantity) AS production_cost FROM tagms.lot AS l
    JOIN tagms.product AS p ON l.product_id = p.product_id
    JOIN tagms.draws_from AS df ON l.lot_id = df.lot_id
    JOIN tagms.order AS o ON df.order_id = o.order_id
WHERE DATE(o.order_date) >= '2021-01-01' AND DATE(o.order_date) <= '2021-12-31';

-- Compute order 1 price from lots bought
select sum(l.lot_price) from tagms.draws_from as d inner join tagms.lot as l on d.lot_id=l.lot_id where d.order_id=1;
