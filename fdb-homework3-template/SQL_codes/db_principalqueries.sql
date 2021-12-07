
--After inserting a new lot with identifier Lot_id (see the previous chapter), execute step 1

-- Step 1: Get the list of items to be decremented given a Lot_id.
SELECT tagms.made_up_of_1.item_id FROM tagms.lot
                                           JOIN tagms.made_up_of_1 ON
    (tagms.lot.product_id = tagms.made_up_of_1.product_id)
WHERE tagms.lot.lot_id = '1'

-- For each item returned by step 1, execute step 2.

-- Step 2: Given an Item_id and a Lot_id, calculate the decrease in quantity and actually decrease the quantity of the item

UPDATE tagms.item
SET quantity = quantity - (
    SELECT tagms.lot.product_quantity * tagms.made_up_of_1.quantity AS decrement_qty FROM tagms.lot
                                                                                              JOIN tagms.made_up_of_1 ON
        (tagms.lot.product_id = tagms.made_up_of_1.product_id AND tagms.made_up_of_1.item_id = '1')
    WHERE tagms.lot.lot_id = '1'
)
WHERE tagms.item.item_id=1;
