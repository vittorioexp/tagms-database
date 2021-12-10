
-- Product_Category

INSERT INTO Tagms.product_Category(Name, Description) VALUES
    ('Beer','An alcoholic beverage typically obtained from the fermentation of wort based on barley malt'),
    ('Soft Drink','Soft Drink is a sparkling flavored drink');

INSERT INTO Tagms.product_Category(Name, Description) VALUES
    ('Juice Pineapple','Juice Pineapple is a drink made from the extraction or pressing of the natural liquid contained in fruit and vegetables') ;

INSERT INTO Tagms.product_Category(Name, Description) VALUES
    ('Smoothie','Smoothie is a drink made by fruit and vegetables in a blender') ;




-- Insert Item_Category

INSERT INTO Tagms.item_Category(name, description) VALUES
    ('Soft Sugar','Soft sugar');

INSERT INTO Tagms.item_Category(name, description) VALUES
    ('Sugar','Special sugar');

INSERT INTO Tagms.item_Category(name, description) VALUES
    ('Coloring','Food coloring');

INSERT INTO Tagms.item_Category(name, description) VALUES
    ('Water','Water');

INSERT INTO Tagms.item_Category(name, description) VALUES
    ('Tape','Tape employed for packaging');

INSERT INTO Tagms.item_Category(name, description) VALUES
    ('Polystyrene','Polystyrene employed for packaging');

INSERT INTO Tagms.item_Category(name, description) VALUES
    ('Aluminum','Aluminum employed for packaging');

INSERT INTO Tagms.item_Category(name, description) VALUES
    ('Plastic','Plastic employed for packaging');

INSERT INTO Tagms.item_Category(name, description) VALUES
    ('Glass','Glass employed for packaging');



-- Package_Category

INSERT INTO Tagms.package_Category(Name, Description) VALUES ('Package XS','Extra small package');

INSERT INTO Tagms.package_Category(Name, Description) VALUES ('Package S','Small package');

INSERT INTO Tagms.package_Category(Name, Description) VALUES ('Package M','Medium package');

INSERT INTO Tagms.package_Category(Name, Description) VALUES ('Package L','Large package');

INSERT INTO Tagms.package_Category(Name, Description) VALUES ('Package XL','Extra large package');



-- Same products can have different packages (and so different Package_weight)
-- E.g., Beer Atomic in aluminum can VS Beer Atomic in glass bottle

-- Product
INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
    ('Beer Atomic in aluminum can','An alcoholic beverage typically obtained from the fermentation of wort based on barley malt',
     '2.00', '2.0', '450', '450', '15', 'Calories: 153, Alcohol: 14 grams, Carbs: 13 grams, Protein: 2 grams, Fat: 0 grams.', '1');

INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
    ('Beer Atomic in glass bottle','An alcoholic beverage typically obtained from the fermentation of wort based on barley malt',
     '2.00', '2.0', '450', '450', '50', 'Calories: 153, Alcohol: 14 grams, Carbs: 13 grams, Protein: 2 grams, Fat: 0 grams.', '1');

INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
    ('Coke Mega in aluminum can','Coca Mega is a carbonated soft drink',
     '1.5', '3', '300', '300', '30', 'Calories: 180, Alcohol: 0 grams, Carbs: 38 grams, Protein: 10 grams, Fat: 4 grams.', '2');

INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
    ('Coke Mega in glass bottle','Coca Mega is a carbonated soft drink',
     '1.5', '3', '300', '300', '52', 'Calories: 180, Alcohol: 0 grams, Carbs: 38 grams, Protein: 10 grams, Fat: 4 grams.', '2');

INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
    ('Juice Pineapple Turbo','Juice Pineapple Turbo is a drink made from the extraction or pressing of the natural liquid contained in fruit and vegetables',
     '1.30', '3.5', '500', '520', '25', 'Calories: 9, Alcohol: 0 grams, Carbs: 2 grams, Protein: 32 grams, Fat: 8 grams.', '3');

INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
    ('Fanta explosive','Fanta explosive is a fruit-flavored carbonated soft drinks',
     '1.5', '2.5', '450', '480', '13', 'Calories: 212, Alcohol: 0 grams, Carbs: 12 grams, Protein: 35 grams, Fat: 120 grams.', '2');

INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
    ('Strawberry Smoothie','Strawberry Smoothie is a vegetable smoothie rich in vitamins',
     '3.60', '2.8', '300', '340', '28', 'Calories: 2, Alcohol: 0 grams, Carbs: 218 grams, Protein: 23 grams, Fat: 8 grams.', '3');

INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
    ('Sprite Refreshing','Sprite Refreshing is a colorless, lemon, lime-flavored and refreshing soft drink',
     '2.15', '2.3', '400', '417', '20', 'Calories: 234, Alcohol: 0 grams, Carbs: 80 grams, Protein: 21 grams, Fat: 48.', '2');



INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Sugar C','Raw cane sugar is a less caloric and healthier sugar','3000000','100000','1');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Sugar W','White sugar for sweeter products','2500000','100000','1');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Sugar I','Brown sugar is rich in vitamins and minerals such as potassium, calcium and magnesium.','500000','200000','2');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Low mineral water','Low mineral content water employed for producing all products','800000','150000','4');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Coloring E100','Food yellow-orange coloring dye extracted from ground rhizomes of natural strains of Curcuma longa','1000000','700000','3');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Coloring E101','Food yellow natural coloring present in milk, it is also present in many green vegetables,','130000','35000','3');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Coloring E150','Food caramel coloring and can also have the function of amalgamating and protecting against oxidation caused by light','2000000','120000','3');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Tape P','Packing tape to ensure a good seal ','220000','75000','5');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Tape T','Transparent adhesive tape available in both silent and noisy unwinding','110000','50000','5');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Tape C','Canvas tape equipped with a dense weave that allows the orker to repair, bind and bead','300000','80000','5');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Polystyrene I','Polystyrene (type I) is an excellent technical insulator','80000','15000','6');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Pallet 4','Pallet (type 4) is an excellent pellet that ensures great resistance against shocks','80','6','6');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Pallet 5','Pallet (type 5) is an excellent pellet that ensures great resistance against shocks','90','5','6');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Aluminum can','Aluminum can with internal coating (coating) which aims to minimize the interaction between the beverage and aluminum','5000','130','7');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Plastic Bottle 1','Plastic bottle (type 1) with heat-insulating','20000','1100','8');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
    ('Glass Bottle 1','Glass bottle (type 1) with heat-insulating','26000','150','9');



-- Package

INSERT INTO Tagms.package(Name, Description, Weight, Height, Width, Depth, Package_Category_ID) VALUES
    ('Package XS-1', 'Extra small package, type 1', '10', '3', '5', '2', '1'),
    ('Package XS-2', 'Extra small package, type 2', '13', '3', '6', '3', '1'),
    ('Package S-1', 'Small package, type 1', '13', '6', '6', '5', '2'),
    ('Package M-1', 'Medium package, type 1', '16', '8', '7', '6', '3'),
    ('Package L-1', 'Large package, type 1', '17', '10', '7', '7', '4'),
    ('Package L-2', 'Large package, type 2', '18', '12', '9', '7', '4'),
    ('Package L-3', 'Large package, type 3', '19', '10', '10', '7', '4'),
    ('Package XL-1', 'Extra large package, type 1', '25', '13', '11', '8', '5'),
    ('Package XL-2', 'Extra large package, type 2', '29', '14', '15', '10', '5');


-- Lot

-- 50 beers, 100 beers of 0.33L price 2 without discount
INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity,
                      Package_Quantity,Package_ID, Product_ID) VALUES
    ('2022-03-14','0.0','22.0', '200', '50', '5','1', '1');

INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity,
                      Package_Quantity,Package_ID, Product_ID) VALUES
    ('2022-04-14','0.0','22.0', '400', '100', '3','1', '1');

-- 50 cokes, 100 cokes of 0.5L price 1.5 without discount
INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity,
                      Package_Quantity,Package_ID, Product_ID) VALUES
    ('2022-05-14','0.0','22', '225', '50', '2','3', '3');

INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity,
                      Package_Quantity,Package_ID, Product_ID) VALUES
    ('2022-05-14','0.0','22', '450', '100', '5','3', '3');

-- 50 juices price 1.3, 100 juices price 3.5 with 10% discount
INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity,
                      Package_Quantity,Package_ID, Product_ID) VALUES
    ('2022-05-14','0.0','22.0', '227.5', '50', '4','5', '5');


INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity,
                      Package_Quantity,Package_ID, Product_ID) VALUES
    ('2022-04-14','10.0','22.0', '455', '100', '4','5', '3');

-- 100 fanta explosive price 1.5 with 5% discount, 70 fanta explosive price 1.5 without discount, 110 fanta explosive price 1.5 with 15% discount
INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity,
                      Package_Quantity,Package_ID, Product_ID) VALUES
    ('2022-11-19','5.0','22.0', '1008.00', '100', '3','5', '6');

INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity,
                      Package_Quantity,Package_ID, Product_ID) VALUES
    ('2022-10-14','0.0','22.0', '165.00', '70', '6','3', '6');

INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity,
                      Package_Quantity,Package_ID, Product_ID) VALUES
    ('2022-06-19','15.0','22.0', '1008.00', '110', '100','5', '6');

-- 30 smoothie of 0.5L price 3.6 with 10% discount (expired), 40 smoothie of 0.5L price 3.6 with 0% discount (expired)

INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity,
                      Package_Quantity,Package_ID, Product_ID) VALUES
    ('2017-06-19','10.0','22.0', '302.40', '30', '100','5', '7');

INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity,
                      Package_Quantity,Package_ID, Product_ID) VALUES
    ('2018-11-24','0.0','22.0', '403.20', '30', '100','5', '7');

-- 30 sprite of 0.5L price 2.15 with 10% discount, 60 sprite of 0.5L price 2.15 with 0% discount (expired)

INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity,
                      Package_Quantity,Package_ID, Product_ID) VALUES
    ('2022-06-10','10.0','22.0', '172.5', '30', '100','5', '8');

INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity,
                      Package_Quantity,Package_ID, Product_ID) VALUES
    ('2020-08-17','0.0','22.0', '345', '60', '100','5', '8');


-- Made_Up_Of_1
-- (For sake of simplicity, we inserted only few tuples in made_up_of 1 and 2)

-- Beer Atomic: contains low mineral water, sugar w, coloring e100
INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
    ('1','4','330');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
    ('1','2','15');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
    ('1','5','3');

-- Coke Mega: contains sugar c, sugar w, low mineral water, coloring e150
INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
    ('2','1','3');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
    ('2','2','3');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
    ('2','4','500');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
    ('2','7','4');


-- Juice: contains sugar c, sugar w, coloring e101, low mineral water
INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
    ('3','1','2');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
    ('3','2','4');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
    ('3','6','2');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
    ('3','4','600');

-- Fanta: contains sugar c, coloring e100, low mineral water
INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
    ('6','1','10');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
    ('6','5','20');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
    ('6','4','550');


-- Made_Up_Of_2
-- (For sake of simplicity, we inserted only few tuples in made_up_of 1 and 2)

--Aluminum Cans 0.33
INSERT INTO tagms.made_up_of_2(Package_ID,Item_ID,Quantity) VALUES
    ('3','14','20'),
    ('3','8','10');

--Plastic bottle 0.5L
INSERT INTO tagms.made_up_of_2(Package_ID,Item_ID,Quantity) VALUES
    ('5','15','30'),
    ('5','9','15');

--Glass bottle 1L
INSERT INTO tagms.made_up_of_2(Package_ID,Item_ID,Quantity) VALUES
    ('1','16','10'),														
    ('1','10','10');


-- Insert customers
INSERT INTO Tagms.customer VALUES
    ('74853719034','Conad','+393895562233','Via Prato 25, Pordenone','conad_pordenone@mail.com',current_date),
    ('56983717634','Coop','+393827762376','Via America 30, Belluno','coop_belluno@mail.com',current_date),
    ('62347815297','Famila','+393336941253','Viale dei Mille 100, Parma','famila_parma@mail.com',current_date),
    ('12564378963','Eurospin','+393346901723','Via 20 Settembre 21, Lecce','eurospin_lecce@mail.com',current_date),
    ('12564378964','PAM','+393315589636','Via Giappone 45, Taranto','pam_taranto@mail.com',current_date);


-- Insert Roles

INSERT INTO Tagms.role(Name,Description) VALUES
    ('Manager','The managers are in charge of interacting with suppliers and concluding contracts with them');

INSERT INTO Tagms.role(Name,Description) VALUES
    ('Worker','The workers take care of production and shipments');

INSERT INTO Tagms.role(Name,Description) VALUES
    ('Salesman','The sellers have to deal with customers and create orders');

INSERT INTO Tagms.role(Name,Description) VALUES
    ('Data Analyst','The data analyst has access to the acquired data for inventory, cost and profit analysis');

-- Insert employees

INSERT INTO Tagms.employee VALUES
    ('FGDVSF30C62D012T','John','Smith','3516235214','johnsmith@gmail.com','1995-12-30','2018-12-12','true',1),
    ('BDBBHH72S22C841N','Adam','Willis','3516931849','adamwillis@gmail.com','1993-11-20','2019-11-11','true',2),
    ('HGDVSF40C62D012T','Bruce','De Forest','3319856644','deforest@gmail.com','1992-11-20','2012-11-11','true',3),
    ('MGHRLQ80B49H779S','Lena','Choi','3358853696','deforest@gmail.com','1992-11-20','2014-05-23','true',3),
    ('QMUHFE38E25G815G','Ronald','Vickers','3352317485','rvickers@gmail.com','1998-07-11','2010-04-23','true',4),
    ('DKLERT23D96A316T','Gurver','Maata','00393403631287','gmaata@gmail.com','1953-06-24','2017-09-14','true',1),
    ('RNNZLB88S21B046D','Solomon','Ayala','00393666549821','sayala@gmail.com','1952-09-10','2016-10-22','true',1);


-- Insert departments

INSERT INTO Tagms.department(Name, Description) VALUES
    ('Operations','Responsible for converting raw materials and packaging materials into finished goods and work to improve the efficiency of the production.');

INSERT INTO Tagms.department(Name, Description) VALUES
    ('Sales','Responsible for the sale of lots.');

INSERT INTO Tagms.department(Name, Description) VALUES
    ('Administration','Responsible for the administration of the accounting of employment contracts and management of personnel, customers and suppliers.');

INSERT INTO Tagms.department(Name, Description) VALUES
    ('Maintenance','Department responsible for the management and maintenance of the different machinery used for production.');

INSERT INTO Tagms.department(Name, Description) VALUES
    ('Shipping','Responsible for marking and shipping lots.');

-- Insert in Work
-- Operations: 2 employees Sales: 2 employees Administration: 1 employee Maintenance: 1 employee Shipping: 2 employees

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES ('1','FGDVSF30C62D012T');

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES ('1','BDBBHH72S22C841N');

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES ('2','HGDVSF40C62D012T');

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES ('2','RNNZLB88S21B046D');

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES ('3','DKLERT23D96A316T');

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES ('2','MGHRLQ80B49H779S');

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES ('4','QMUHFE38E25G815G');

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES ('5','QMUHFE38E25G815G');

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES ('5','RNNZLB88S21B046D');


-- Insert suppliers

INSERT INTO Tagms.supplier(vat_number, supplier_name, phone_number, email_address, address, registration_date) VALUES
    ('86334519757','Reg s.r.l.','3794567845','regsrl@gmail.com','Via Roma 4 35100 Padova','2021-12-04');

INSERT INTO Tagms.supplier(vat_number, supplier_name, phone_number, email_address, address, registration_date) VALUES
    ('23932902833','VisumH2O','3396547835','vish2o@gmail.com','Via Trieste 4 31100 Treviso','2021-10-07');

INSERT INTO Tagms.supplier(vat_number, supplier_name, phone_number, email_address, address, registration_date) VALUES
    ('23232503889','EnergyFeed s.p.a.','3365447309','feed4life@gmail.com','Via Venezia 7 19100 Spezia','2021-04-08');

INSERT INTO Tagms.supplier(vat_number, supplier_name, phone_number, email_address, address, registration_date) VALUES
    ('22134054695','ReSugar','3366244789','sugar@gmail.com','Via Marsalis 1 81290 Firenze','2021-01-02');

INSERT INTO Tagms.supplier(vat_number, supplier_name, phone_number, email_address, address, registration_date) VALUES
    ('45288712635','MaterialPCK','3366244789','matforpack@gmail.com','Via Resto 1 23202 Rovigo','2021-02-011');




-- Inserting contracts, be careful that the supplier_id and employee_id to be inserted already exist in tables supplier and employee

INSERT INTO tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) VALUES
    ('contract with Reg s.r.l.','2020-01-18','2021-12-06','2023-12-31','86334519757','FGDVSF30C62D012T');

INSERT INTO tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) VALUES
    ('contract with Reg s.r.l.','2021-02-01','2021-12-08','2024-12-31','86334519757','DKLERT23D96A316T');

INSERT INTO tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) VALUES
    ('contract with VisumH2O','2019-01-25','2021-12-07','2022-12-31','23932902833','FGDVSF30C62D012T');

INSERT INTO tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) VALUES
    ('contract with ReSugar','2017-06-11','2021-12-21','2025-04-01','22134054695','RNNZLB88S21B046D');

INSERT INTO tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) VALUES
    ('contract with MaterialPCK','2021-01-17','2021-12-01','2023-05-22','45288712635','RNNZLB88S21B046D');

INSERT INTO tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) VALUES
    ('contract with EnergyFeed s.p.a.','2018-02-07','2021-12-05','2022-03-14','45288712635','DKLERT23D96A316T');

INSERT INTO tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) VALUES
    ('contract with Reg s.r.l.','2020-03-12','2021-11-06','2023-10-31','86334519757','FGDVSF30C62D012T');

INSERT INTO tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) VALUES
    ('contract with Reg s.r.l.','2020-04-17','2021-10-06','2023-12-30','86334519757','FGDVSF30C62D012T');

-- Inserting rows in specify, be sure that item_id and contract_id exist in tables item and contract

-- Attributes order: item_id, contract_id, price, purchased_quantity

INSERT INTO tagms.specify VALUES
    (1,4,10200,7500),
    (2,4,12200,1000),
    (3,4,10231,5000),
    (8,5,331,400),
    (9,5,671,222),
    (10,5,349,380),
    (11,5,293,200);


-- Insert orders
INSERT INTO Tagms.order(net_price, taxes, order_date, order_paid, employee_id, customer_id) VALUES
    (100,50,'2020-04-25','true','HGDVSF40C62D012T','56983717634'),
    (150,75,'2021-12-01','true','HGDVSF40C62D012T','12564378963'),
    (160,20,'2021-04-25','true','MGHRLQ80B49H779S','56983717634'),
    (200,40,current_date,'true','MGHRLQ80B49H779S','74853719034'),
    (500,200,current_date,'false','MGHRLQ80B49H779S','62347815297');


-- Draws_from
INSERT INTO Tagms.draws_from(Lot_ID, Order_ID) VALUES
    ('1','1');
INSERT INTO Tagms.draws_from(Lot_ID, Order_ID) VALUES
    ('3','2');
INSERT INTO Tagms.draws_from(Lot_ID, Order_ID) VALUES
    ('2','3');
INSERT INTO Tagms.draws_from(Lot_ID, Order_ID) VALUES
    ('4','1');
INSERT INTO Tagms.draws_from(Lot_ID, Order_ID) VALUES
    ('5','1');
INSERT INTO Tagms.draws_from(Lot_ID, Order_ID) VALUES
    ('6','4');
INSERT INTO Tagms.draws_from(Lot_ID, Order_ID) VALUES
    ('7','5');


-- Inserting ships, be careful with the shipping_date and with the Order_ID that must be in the table order
INSERT INTO Tagms.ship(Order_ID, Employee_ID, Shipping_date,Track_num) VALUES
    (1,'BDBBHH72S22C841N','2021-04-27','LM003926195IT'),
    (2,'BDBBHH72S22C841N','2021-12-03','SL690657695IT'),
    (3,'BDBBHH72S22C841N','2021-04-27','RT463451577IT');







