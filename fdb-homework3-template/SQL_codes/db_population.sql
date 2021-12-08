
-- Product_Category

INSERT INTO Tagms.product_Category(Name, Description) VALUES 
('Beer','An alcoholic beverage typically obtained from the fermentation of wort based on barley malt');

INSERT INTO Tagms.product_Category(Name, Description) VALUES
('Soft Drink','Soft Dirnk is a sparkling flavored drink');

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



-- Package_Category

INSERT INTO Tagms.package_Category(Name, Description) VALUES ('Package XS','Extra small package');

INSERT INTO Tagms.package_Category(Name, Description) VALUES ('Package S','Small package');

INSERT INTO Tagms.package_Category(Name, Description) VALUES ('Package M','Medium package');

INSERT INTO Tagms.package_Category(Name, Description) VALUES ('Package L','Large package');

INSERT INTO Tagms.package_Category(Name, Description) VALUES ('Package XL','Extra large package');



-- TODO: Check if works
-- Same products can have different packages (diferent Package_weight)
-- Product
INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
('Beer Atomic','An alcoholic beverage typically obtained from the fermentation of wort based on barley malt',
'2.00', '2.0', '450', '450', '15', 'Calories: 153, Alcohol: 14 grams, Carbs: 13 grams, Protein: 2 grams, Fat: 0 grams.', '1');

INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
('Beer Atomic','An alcoholic beverage typically obtained from the fermentation of wort based on barley malt',
'2.00', '2.0', '450', '450', '50', 'Calories: 153, Alcohol: 14 grams, Carbs: 13 grams, Protein: 2 grams, Fat: 0 grams.', '1');

INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
('Coke Mega','Coca Mega is a carbonated soft drink',
'1.5', '3', '300', '300', '30', 'Calories: 180, Alcohol: 0 grams, Carbs: 38 grams, Protein: 10 grams, Fat: 4 grams.', '2');

INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
('Coke Mega','Coca Mega is a carbonated soft drink',
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



-- TODO: Check if works

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Sugar C','Raw cane sugar is a less caloric and healthier sugar','300','100','1');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Sugar W','White sugar for sweeter products','250','100','1');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Sugar I','Brown sugar is rich in vitamins and minerals such as potassium, calcium and magnesium.','500','200','2');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Low mineral water','Low mineral content water employed for producing all products','800','150','4');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Coloring E100','Food yellow-orange coloring dye extracted from ground rhizomes of natural strains of Curcuma longa','1000','700','3');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Coloring E101','Food yellow natural coloring present in milk, it is also present in many green vegetables,','130','35','3');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Coloring E150','Food caramel coloring and can also have the function of amalgamating and protecting against oxidation caused by light','200','120','3');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Tape P','Packing tape to ensure a good seal ','220','75','5');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Tape T','Transparent adhesive tape available in both silent and noisy unwinding','110','50','5');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Tape C','Canvas tape equipped with a dense weave that allows the orker to repair, bind and bead','300','80','5');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Polystyrene I','Polystyrene (type I) is an excellent technical insulator','800','150','6');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Pellets 4','Polystyrene (type 4) is an excellent pellet that ensures great resistance against shocks','800','150','6');




-- TODO: Check if works
-- Package

INSERT INTO Tagms.package(Name, Description, Weight, Height, Width, Depth,
Package_Category_ID) VALUES
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
-- 50 beers, 100 beers of 0.33L price 1.5 without discount
INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity, 
Package_Quantity,Package_ID, Product_ID) VALUES 
('2022-03-14','0.0','22.0', '75.00', '50', '50','1', '1');

INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity, 
Package_Quantity,Package_ID, Product_ID) VALUES 
('2022-04-14','0.0','22.0', '150.00', '100', '100','1', '1');

-- 50 cokes, 100 cokes of 0.5L price 1.6 without discount
INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity, 
Package_Quantity,Package_ID, Product_ID) VALUES 
('2022-05-14','0.0','22', '80.00', '50', '50','3', '2');

INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity, 
Package_Quantity,Package_ID, Product_ID) VALUES 
('2022-05-14','0.0','22', '160.00', '100', '100','3', '2');

--50 juices price 1.4 
INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity, 
Package_Quantity,Package_ID, Product_ID) VALUES 
('2022-05-14','0.0','22.0', '70.00', '50', '50','5', '3');

--100 juices price 1.4 with 10% discount 
INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity, 
Package_Quantity,Package_ID, Product_ID) VALUES 
('2022-04-14','10.0','22.0', '140.00', '100', '100','5', '3');

INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity,
Package_Quantity,Package_ID, Product_ID) VALUES
('2022-06-19','10.0','22.0', '1008.00', '100', '100','5', '7');





-- Made_Up_Of_1
-- Beer Atomic

--contains water and coloring 1R and 1B
INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('1','4','4');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('1','5','2');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('1','7','330');

-- Coke Mega 

--contains Soft Sugar A, Soft Sugar B, Sugar K and low mineral water
INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('2','1','3');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('2','2','3');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('2','3','3');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('2','7','500');

--contains coloring 1G and 1B
INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('2','5','2');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('2','6','4');

-- Juice

--contains Soft Sugar A, Soft Sugar B, Sugar K and low mineral water
INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('3','1','2');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('3','2','2');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('3','3','2');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('3','7','1000');

--contains coloring 1G,1R
INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('3','4','3');

INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('3','5','3');

-- TODO: Add many IN A WAY THAT MAKES SENSE, Martin

--Aluminum Cans 0.33
INSERT INTO tagms.made_up_of_2(Package_ID,Item_ID,Quantity) VALUES 
('1','8','2'), 
('1','11','10'); 

--Plastic bottle 0.5L
INSERT INTO tagms.made_up_of_2(Package_ID,Item_ID,Quantity) VALUES 
('2','9','2'), 
('2','11','15');

--Glass bottle 1L
INSERT INTO tagms.made_up_of_2(Package_ID,Item_ID,Quantity) VALUES 
('3','10','2'), 
('3','11','20');


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

-- TODO: Insert many, Amedeo
-- Inserting rows in specify, be sure that item_id and contract_id exist in tables item and contract

INSERT INTO tagms.specify VALUES
(1,4,10,75),
(2,4,10,100),
(3,4,10,50),
(8,5,5,200),
(9,5,5,150),
(10,5,5,50),
(11,5,2,200);



-- TODO: Insert many, Amedeo
-- Insert orders 
INSERT INTO Tagms.order(net_price, taxes, order_date, order_paid, employee_id, customer_id) VALUES 
(100,50,'2021-04-25','true','HGDVSF40C62D012T',56983717634),
(150,75,'2021-12-01','true','HGDVSF40C62D012T',12564378963),
(160,20,'2021-04-25','true','MGHRLQ80B49H779S',56983717634),
(200,40,current_date,'true','MGHRLQ80B49H779S',74853719034),
(500,200,current_date,'true','MGHRLQ80B49H779S',62347815297);



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




-- TODO: insert many, Amedeo
-- Inserting ships, be careful with the shipping_date and with the Order_ID that must be in the table order
INSERT INTO Tagms.ship(Order_ID, Employee_ID, Shipping_date,Track_num) VALUES
(2,'BDBBHH72S22C841N','2021-04-26','LM003926195IT'),
(3,'BDBBHH72S22C841N','2021-12-03','SL690657695IT'),
(4,'BDBBHH72S22C841N','2021-04-27','RT463451577IT');







