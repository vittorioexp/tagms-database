-- TODO: can we remove this?
/*SELECT t1.attr1
FROM table1 as t1
         LEFT JOIN table2 as t2 ON t1.attr2=t2.attr1
WHERE t1.attr3=1*/



-- TODO: is this useful? 2 employee can have the same name by the way
-- list all contracts between a certain manager and a certain supplier
select tagms.contract.* from tagms.contract inner join tagms.employee on
        tagms.contract.employee_id=tagms.employee.tax_number inner join tagms.supplier on
        tagms.contract.supplier_id=tagms.supplier.vat_number where tagms.employee.tax_number='BDBBHH72S22C841N' and
        tagms.supplier.supplier_name='Reg s.r.l.';



-- TODO: aren't the following 2 too simple?
-- list all outbound transactions sorted from most to least amount of money:
select tagms.order.* from tagms.order order by tagms.order.net_price DESC;

-- list all inbound transactions sorted from most to least amount of money:
select tagms.specify.* from tagms.specify order by tagms.specify.price DESC;




-- Show all the details of the employees in the organization

select tagms.employee.*, tagms.department.name from tagms.employee inner join tagms.work on
        tagms.employee.tax_number=tagms.work.employee_id inner join tagms.department on
        tagms.work.department_id=tagms.department.department_id where tagms.employee.still_working=TRUE;



-- TODO: come evitare di ripetere due volte il lot_id = '3'?


-- After inserting a new lot with identifier Lot_id (see the "populate" section)
-- decrease the quantity of the items involved in the production of a lot
-- Note: it is necessary to insert the Lot_id twice in the query

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



-- Lists all available lots (unsold and that won't expire in 6 months) containing
-- a particular product having a given Product_id as identifier,
-- sorted by expiration date (oldest lots must be sold first).

SELECT l.lot_id,
       DATE(l.expiration_date) AS expiration_date,
       l.product_id,
       l.product_quantity,
       ROUND(l.lot_price * (1 + l.vat/100) * (1 - l.lot_discount/100), 2) AS gross_price
FROM tagms.lot AS l
    LEFT OUTER JOIN tagms.draws_from AS df ON l.lot_id = df.lot_id
WHERE l.product_id = '6'
  AND l.expiration_date > (current_date + interval '6 months')
  AND df.order_id IS NULL
ORDER BY l.expiration_date ASC;



-- TODO: Possiamo mettere i risultati di queste selezioni all'interno di una tabella
--  e fare qualche operazione tra queste 3 diverse righe
--  oppure teniamo tre query separate per semplicità?

-- Get the net sales and paid taxes in a given time interval
SELECT SUM(o.net_price) AS net_sales, SUM(o.taxes) AS taxes FROM tagms.order AS o
    WHERE DATE(o.order_date) >= '2021-01-01' AND
          DATE(o.order_date) <= '2021-12-31' AND
          o.order_paid = TRUE;

-- Get the cost of materials in a given time interval
SELECT SUM(sp.price) AS cost_of_material FROM tagms.specify as sp
    INNER JOIN tagms.contract AS c ON c.contract_id = sp.contract_id
WHERE DATE(c.contract_date) >= '2021-01-01' AND DATE(c.contract_date) <= '2021-12-31';

-- Get the production cost in a given time interval
SELECT SUM(p.production_cost * l.product_quantity) AS production_cost FROM tagms.lot AS l
    JOIN tagms.product AS p ON l.product_id = p.product_id
    JOIN tagms.draws_from AS df ON l.lot_id = df.lot_id
    JOIN tagms.order AS o ON df.order_id = o.order_id
WHERE DATE(o.order_date) >= '2021-01-01' AND DATE(o.order_date) <= '2021-12-31';

-- Note: BETWEEN was not used as it makes a strict comparison (extremes excluded)



-- When inserting an order, the operator can choose a custom price (e.g., decided with the customer)
-- or use the following query.
-- Given an order with Order_id, compute the order's net_price and total taxes.
-- Note: the given Order_id must be written twice in the query

UPDATE tagms.order AS o
SET net_price = tmp.net_price,
    taxes = tmp.taxes
FROM (
         SELECT SUM(l.lot_price * (1 - l.lot_discount / 100)) AS net_price,
                SUM(l.lot_price * l.VAT/100) as taxes
         FROM tagms.draws_from AS df
                  INNER JOIN tagms.lot AS l ON df.lot_id = l.lot_id
        WHERE df.order_id = '2'
    ) AS tmp(net_price, taxes)
WHERE o.order_id = '2'
RETURNING o.order_id, o.net_price, o.taxes;


-- When inserting a lot, the operator can choose a custom price
-- or use the following query.
-- Given a lot with Lot_id, compute the lot price
-- Note: the given Lot_id must be written twice in the query

UPDATE tagms.lot AS l
SET lot_price = tmp.lot_price
FROM (
         SELECT p.production_cost*p.price_increase*l.product_quantity
             AS lot_price FROM tagms.lot AS l
            INNER JOIN tagms.product AS p ON l.product_id = p.product_id
         WHERE l.lot_id = '3'
     ) AS tmp(lot_price)
WHERE l.lot_id = '3'
RETURNING *;


-- Given an item (which is used to create a product) having Item_id as identifier
-- and a time interval (actually, two dates),
-- find the total quantity of that item that has been used for production or packaging during that time.

SELECT SUM(l.product_quantity * m1.quantity) AS quantity FROM tagms.made_up_of_1 AS m1
    INNER JOIN tagms.lot AS l ON m1.product_id = l.product_id
    INNER JOIN tagms.draws_from AS df ON l.lot_id = df.lot_id
    INNER JOIN tagms.order AS o ON df.order_id = o.order_id
WHERE m1.item_id = '9'
  AND DATE(o.order_date) >= '2021-01-01'
  AND DATE(o.order_date) <= '2021-12-31';


-- TODO: va bene la query precedente o bisogna proprio fare funzionare questa di seguito?
--  che in teoria potrebbe funzionare con qualsiasi tipo di item
/*
SELECT SUM(l.product_quantity * m.quantity) AS quantity FROM
    (
            SELECT * FROM tagms.made_up_of_1 AS m1
        UNION
            SELECT * FROM tagms.made_up_of_2 AS m2
    )
    AS m(product_id, item_id, quantity)
    INNER JOIN tagms.lot AS l ON m.product_id = l.product_id
    INNER JOIN tagms.draws_from AS df ON l.lot_id = df.lot_id
    INNER JOIN tagms.order AS o ON df.order_id = o.order_id
WHERE m.item_id = '8'
  AND DATE(o.order_date) >= '2021-01-01'
  AND DATE(o.order_date) <= '2021-12-31';
 */

-- TODO: query che ritorna gli items che sono sotto la soglia minima di giacenza (troppo facile?)

SELECT * FROM tagms.item AS i
WHERE i.quantity < i.minimum_quantity;

-- Return the list of unsellable lots which are in stock (that will expire in less than 6 months)
SELECT * FROM tagms.lot AS l
    LEFT OUTER JOIN tagms.draws_from AS df ON l.lot_id = df.lot_id
WHERE l.expiration_date <= (current_date + interval '6 months')
  AND df.order_id IS NULL;

