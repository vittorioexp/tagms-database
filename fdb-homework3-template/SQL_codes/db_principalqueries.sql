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

select tagms.supplier.* from tagms.supplier;

select tagms.customer.* from tagms.customer;







--After inserting a new lot with identifier Lot_id (see the previous chapter), execute step 1

-- Step 1: Get the list of items to be decremented given a Lot_id.
SELECT tagms.made_up_of_1.item_id FROM tagms.lot
                                           JOIN tagms.made_up_of_1 ON
    (tagms.lot.product_id = tagms.made_up_of_1.product_id)
WHERE tagms.lot.lot_id = '1';

-- For each item returned by step 1, execute step 2.

-- Step 2: Given an Item_id and a Lot_id, calculate the decrease in quantity
-- and actually decrease the quantity of the item

UPDATE tagms.item
SET quantity = quantity - (
    SELECT tagms.lot.product_quantity * tagms.made_up_of_1.quantity AS decrement_qty FROM tagms.lot
        JOIN tagms.made_up_of_1 ON
            (tagms.lot.product_id = tagms.made_up_of_1.product_id AND tagms.made_up_of_1.item_id = '1')
    WHERE tagms.lot.lot_id = '1'
)
WHERE tagms.item.item_id=1;







-- After inserting a new contract with identifier Contract_id,
-- in the delivery date the quantities of items in stock must be incremented

-- Step 1: list all the items, having Item_id, whose quantity must be incremented.

SELECT tagms.specify.item_id FROM tagms.contract
    JOIN tagms.specify ON tagms.contract.contract_id = tagms.specify.contract_id
    WHERE tagms.contract.contract_id = '3';

-- For each item returned by step 1, execute step 2.

-- Step 2: given an Item_ID and a Contract_id, get the increase in quantity
-- and actually increase the quantity of the item

UPDATE tagms.item
SET quantity = quantity + (
    SELECT tagms.specify.purchased_quantity AS increment_qty FROM tagms.contract
        JOIN tagms.specify ON
        (tagms.contract.contract_id = tagms.specify.contract_id
             AND tagms.specify.item_id = '1')
        WHERE tagms.contract.contract_id = '3'
)
WHERE tagms.item.item_id='1';









-- Lists all available (unsold and that won't expire in 6 months) lots stocking
-- a particular product with Product_id identifier,
-- sorted by expiration date (oldest lots must be sold first).

SELECT * FROM tagms.lot WHERE
        tagms.lot.product_id = '1'
            AND
        (SELECT COUNT(Tagms.draws_from.lot_id)
            FROM tagms.draws_from
            WHERE tagms.draws_from.lot_id = '1'
            ) = 1
            AND
        tagms.lot.expiration_date > (current_date + interval '6 months')
    ORDER BY tagms.lot.expiration_date ASC;


