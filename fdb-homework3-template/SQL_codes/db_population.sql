--TODO: Explain IN THE LATEX FILE that we used different metods on purpose


-- Product_Category

INSERT INTO Tagms.product_Category(Name, Description) VALUES 
('Beer','An alcoholic beverage typically obtained from the fermentation of wort based on barley malt');

INSERT INTO Tagms.product_Category(Name, Description) VALUES
('Coke','Coke is a carbonated soft drink');

INSERT INTO Tagms.product_Category(Name, Description) VALUES
('Juice Pineapple','Juice Pineapple is a drink made from the extraction or pressing of the natural liquid contained in fruit and vegetables') ;

INSERT INTO Tagms.product_Category(Name, Description) VALUES
('Smoothie','Smoothie is a drink made by fruit and vegetables in a blender') ;




-- Insert Item_Categorys

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




-- TODO: Check if works
-- Package_Category

INSERT INTO Tagms.package_Category(Name, Description) VALUES ('Package XS','Extra small package');

INSERT INTO Tagms.package_Category(Name, Description) VALUES ('Package S','Small package');

INSERT INTO Tagms.package_Category(Name, Description) VALUES ('Package M','Medium package');

INSERT INTO Tagms.package_Category(Name, Description) VALUES ('Package L','Large package');

INSERT INTO Tagms.package_Category(Name, Description) VALUES ('Package XL','Extra large package');




-- TODO: ADD PRODUCTS
-- Product
INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
('Beer Atomic','An alcoholic beverage typically obtained from the fermentation of wort based on barley malt',
'1.00', '2.0', '1', '1', '1', 'Calories: 153, Alcohol: 14 grams, Carbs: 13 grams, Protein: 2 grams, Fat: 0 grams.', '1');

INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
('Coke Mega','Coca Mega is a carbonated soft drink',
'1.00', '2.0', '1', '1', '1', 'Calories: 153, Alcohol: 0 grams, Carbs: 13 grams, Protein: 2 grams, Fat: 0 grams.', '2');

INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
('Juice Pineapple Turbo','Juice Pineapple Turbo is a drink made from the extraction or pressing of the natural liquid contained in fruit and vegetables',
'1.00', '2.0', '1', '1', '1', 'Calories: 153, Alcohol: 0 grams, Carbs: 13 grams, Protein: 2 grams, Fat: 0 grams.', '3');



-- TODO: fix item_category_id
-- Inserting items, be sure that item_category_id exists in table item_category

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Soft Sugar A','Soft sugar (Type A) with composition X, Y, and Z','100','50','1');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Soft Sugar B','Soft sugar (Type B) with composition X, Y, and Z','120','20','1');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Sugar K','Special sugar (Type K) with composition X, Y, and Z','1000','700','3');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Coloring 1R','Food coloring (type 1, red) with composition X, Y, and Z','1000','700','3');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Coloring 1G','Food coloring (type 1, green) with composition X, Y, and Z','1000','700','3');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Coloring 1B','Food coloring (type 1, blue) with composition X, Y, and Z','600','250','5');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Low mineral water','Low mineral content water employed for producing all products','800','150','2');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Tape 1M','Tape (type 1, medium) employed for packaging','800','150','2');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Tape 1L','Tape (type 1, large) employed for packaging','800','150','2');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Tape 1XL','Tape (type 1, extra large) employed for packaging','800','150','2');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Polystyrene W','Polystyrene (type W) employed for packaging','800','150','2');





-- TODO: fix description, for example 'Extra small package, type 1'
-- TODO: fix dimensions so that they have sense
-- Package

INSERT INTO Tagms.package(Name, Description, Weight, Height, Width, Depth, 
Package_Category_ID) VALUES
('Package XS-1', 'Aluminum cans 0.33L', '2', '5', '3', '3', '01'),
('Package XS-2', 'Plastic bottle 0,75L ', '3', '6', '3', '3', '02'),
('Package S-1', 'Plastic bottle 0.5L ', '3', '6', '3', '3', '02'),
('Package M-1', 'Glass bottle 0.75L ', '3', '8', '3', '3', '03'),
('Package L-1', 'Glass bottle 1L ', '3', '10', '3', '3', '03'),
('Package L-2', 'Glass bottle 1L ', '3', '10', '3', '3', '03'),
('Package L-3', 'Glass bottle 1L ', '3', '10', '3', '3', '03'),
('Package XL-1', 'Glass bottle 1L ', '3', '10', '3', '3', '03'),
('Package XL-2', 'Glass bottle 1L ', '3', '10', '3', '3', '03');




-- TODO: Check if works
-- Lot
INSERT INTO Tagms.lot(Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity, 
Package_Quantity,Package_ID, Product_ID) VALUES 
('2022-03-14','0.3','44576685449', '330.50', '50', '10','337', '13');




-- TODO: Check if works
-- Made_Up_Of_1
INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('1234','11','10'), ('1234','12','5'), ('1234','13','2');



-- TODO: Check if works
-- Made_Up_Of_2
INSERT INTO Tagms.made_Up_Of_2(Package_ID, Item_ID, Quantity) VALUES
('454','15','4');
('14','129','300');


-- 6.Insert customers
INSERT INTO Tagms.customer VALUES
('74853719034','Conad','+393895562233','Via Prato 25, Pordenone','conad_pordenone@mail.com',current_date),
('56983717634','Coop','+393827762376','Via America 30, Belluno','coop_belluno@mail.com',current_date),
('62347815297','Famila','+393336941253','Viale dei Mille 100, Parma','famila_parma@mail.com',current_date),
('12564378963','Eurospin','+393346901723','Via 20 Settembre 21, Lecce','eurospin_lecce@mail.com',current_date),
('12564378964','PAM','+393315589636','Via Giappone 45, Taranto','pam_taranto@mail.com',current_date);




-- 1.Insert Roles
INSERT INTO Tagms.role(Name,Description) VALUES 
('Manager','The managers are in charge of interacting with suppliers and concluding contracts with them');

INSERT INTO Tagms.role(Name,Description) VALUES 
('Worker','The workers take care of production and shipments');

INSERT INTO Tagms.role(Name,Description) VALUES 
('Salesman','The sellers have to deal with customers and create orders');

INSERT INTO Tagms.role(Name,Description) VALUES 
('Data Analyst','The data analyst has access to the acquired data for inventory, cost and profit analysis');




-- 2.Insert employees
INSERT INTO Tagms.employee VALUES
('FGDVSF30C62D012T','John','Smith','3516235214','johnsmith@gmail.com','1995-12-30','2018-12-12','true',1),
('BDBBHH72S22C841N','Adam','Willis','3516931849','adamwillis@gmail.com','1993-11-20','2019-11-11','true',2),
('HGDVSF40C62D012T','Bruce','De Forest','3319856644','deforest@gmail.com','1992-11-20','2012-11-11','true',3),
('QMUHFE38E25G815G','Ronald','Vickers','3352317485','rvickers@gmail.com','1998-07-11','2010-04-23','true',4),
('DKLERT23D96A316T','Gurver','Maata','00393403631287','gmaata@gmail.com','1953-06-24','2017-09-14','true',1),
('RNNZLB88S21B046D','Solomon','Ayala','00393666549821','sayala@gmail.com','1952-09-10','2016-10-22','true',1);



-- 3.Insert departments

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




-- 4. Insert in Work 
INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES ('1','FGDVSF30C62D012T');

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES ('2','FGDVSF30C62D012T');

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES ('1','HGDVSF40C62D012T');




-- 5.Insert suppliers

INSERT INTO Tagms.supplier(vat_number, supplier_name, phone_number, email_address, address, registration_date) VALUES  
('86334519757','Reg s.r.l.','3794567845','regsrl@gmail.com','Via Roma 4 35100 Padova','2021-12-04'); 
 
INSERT INTO Tagms.supplier(vat_number, supplier_name, phone_number, email_address, address, registration_date) VALUES  
('23932902833','VisumH2O','3396547835','vish2o@gmail.com','Via Trieste 4 31100 Treviso','2021-10-07'); 
 
INSERT INTO Tagms.supplier(vat_number, supplier_name, phone_number, email_address, address, registration_date) VALUES  
('23232503889','EnergyFeed s.p.a.','3365447309','feed4life@gmail.com','Via Venezia 7 19100 Spezia','2021-04-08'); 

INSERT INTO Tagms.supplier(vat_number, supplier_name, phone_number, email_address, address, registration_date) VALUES  
('22134054695','ReSugar','3366244789','sugar@gmail.com','Via Marsalis 1 81290 Firenze','2021-01-02'); 
 
INSERT INTO Tagms.supplier(vat_number, supplier_name, phone_number, email_address, address, registration_date) VALUES  
('22134038695','MaterialPCK','3366244789','matforpack@gmail.com','Via Resto 1 23202 Rovigo','2021-02-011');




--9. Inserting contracts, be careful that the supplier_id and employee_id to be inserted already exist in tables supplier and employee
INSERT INTO tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) VALUES 
('contract with supplier 1','2020-01-18','2021-12-06','2023-12-31','86334519757','FGDVSF30C62D012T');

INSERT INTO tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) VALUES 
('contract with supplier 1','2021-02-01','2021-12-08','2024-12-31','86334519757','BDBBHH72S22C841N');

INSERT INTO tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) VALUES 
('contract with supplier 2','2019-01-25','2021-12-07','2022-12-31','23932902833','FGDVSF30C62D012T');



-- 12.Inserting rows in specify, be sure that item_id and contract_id exist in tables item and contract
INSERT INTO Tagms.specify(item_id, contract_id, price, purchased_quantity) VALUES ('1','3','14.50','100');






-- 7.Insert orders 
INSERT INTO Tagms.order(Net_price, Taxes, Order_date, Order_paid, Employee_ID, 
Customer_ID) VALUES 
('230.20', '23.02', '2021-12-04 17:30:00', 'true', 'FGDVSF30C62D012T', '74853719034'),
('356.26', '13.59', '2021-12-04 12:00:22', 'true', 'BDBBHH72S22C841N', '12564378964')






-- TODO: Check if works
-- Draws_from
INSERT INTO Tagms.draws_from(Lot_ID, Order_ID) VALUES 
('22443','4445');
('150','39');





-- 8.Inserting ships, be careful with the shipping_date and with the Order_ID that must be in the table order
INSERT INTO Tagms.ship(Order_ID, Employee_ID, Shipping_date,Track_num) VALUES 
('5','FGDVSF30C62D012T', '2022-11-27 17:28:00','ZXU098123');







