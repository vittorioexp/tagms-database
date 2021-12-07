--TODO: Explain that we used different metods on purpose
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

INSERT INTO Tagms.department(Name, Description) VALUES ('Operations','Responsible for converting raw materials and packaging materials into finished goods and work to improve the efficiency of the production.');

INSERT INTO Tagms.department(Name, Description) VALUES ('Sales','Responsible for the sale of lots.');

INSERT INTO Tagms.department(Name, Description) VALUES ('Administration','Responsible for the administration of the accounting of employment contracts and management of personnel, customers and suppliers.');

INSERT INTO Tagms.department(Name, Description) VALUES ('Maintenance','Department responsible for the management and maintenance of the different machinery used for production.');

INSERT INTO Tagms.department(Name, Description) VALUES ('Shipping','Responsible for marking and shipping lots.');

-- 4. Insert in Work 
INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES 
('1','FGDVSF30C62D012T');

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES 
('2','FGDVSF30C62D012T');

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES 
('1','HGDVSF40C62D012T');

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

-- 6.Insert customers
INSERT INTO Tagms.customer VALUES
('74853719034','Conad','+393895562233','Via Prato 25, Pordenone','conad_pordenone@mail.com',current_date),
('56983717634','Coop','+393827762376','Via America 30, Belluno','coop_belluno@mail.com',current_date),
('62347815297','Famila','+393336941253','Viale dei Mille 100, Parma','famila_parma@mail.com',current_date),
('12564378963','Eurospin','+393346901723','Via 20 Settembre 21, Lecce','eurospin_lecce@mail.com',current_date),
('12564378964','PAM','+393315589636','Via Giappone 45, Taranto','pam_taranto@mail.com',current_date);

-- 7.Insert orders 
INSERT INTO Tagms.order(Net_price, Taxes, Order_date, Order_paid, Employee_ID, 
Customer_ID) VALUES 
('230.20', '23.02', '2021-12-04 17:30:00', 'true', 'FGDVSF30C62D012T', '74853719034'),
('356.26', '13.59', '2021-12-04 12:00:22', 'true', 'BDBBHH72S22C841N', '12564378964')

-- 8.Inserting ships, be careful with the shipping_date and with the Order_ID that must be in the table order
INSERT INTO Tagms.ship(Order_ID, Employee_ID, Shipping_date,Track_num) VALUES 
('5','FGDVSF30C62D012T', '2022-11-27 17:28:00','ZXU098123');

--9. Inserting contracts, be careful that the supplier_id and employee_id to be inserted already exist in tables supplier and employee
insert into tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) values ('contract with supplier 1','2020-01-18','2021-12-06','2023-12-31','86334519757','FGDVSF30C62D012T');
insert into tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) values ('contract with supplier 1','2021-02-01','2021-12-08','2024-12-31','86334519757','BDBBHH72S22C841N');
insert into tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) values ('contract with supplier 2','2019-01-25','2021-12-07','2022-12-31','23932902833','FGDVSF30C62D012T');

-- 10. Insert Item_Categorys
INSERT INTO Tagms.item_Category(name, description) VALUES
('Sugar','Soft sugar employed for producing juices and cokes');

INSERT INTO Tagms.item_Category(name, description) VALUES
('Coloring','Food coloring employed for producing juices, cokes, smoothies');

INSERT INTO Tagms.item_Category(name, description) VALUES
('Water','Water employed for producing all products');

INSERT INTO Tagms.item_Category(name, description) VALUES
('Tape','Tape employed for producing packages');

INSERT INTO Tagms.item_Category(name, description) VALUES
('Polystyrene','Polystyrene employed for producing packages');

-- 11.Inserting items, be sure that item_category_id exists in table item_category
INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Sugar K','Sugar k employed for producing coke j and coke k','100','50','1');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Sugar S','Sugar k employed for producing coke s and coke k','120','20','1');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Water W','Distilled Water W employed for producing all products','1000','700','3');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Water L','Low mineral content water Water W employed for producing all products','1000','700','3');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Polystyrene P','Refined polystyrene P employed for producing fragile packages','600','250','5');

INSERT INTO Tagms.item(name, description, quantity, minimum_quantity, item_category_id) VALUES
('Colorant C','Coloring C (caramel) employed for producing coke j and coke k','800','150','2');

-- 12.Inserting rows in specify, be sure that item_id and contract_id exist in tables item and contract
INSERT INTO Tagms.specify(item_id, contract_id, price, purchased_quantity) VALUES
('1','3','14.50','100');

-- Product_Category
INSERT INTO Tagms.product_Category(Name, Description) VALUES 
('Beer','An alcoholic beverage typically obtained from the fermentation of wort based on barley malt');
INSERT INTO Tagms.product_Category(Name, Description) VALUES
('Coke','Coca-Cola, or Coke, is a carbonated soft drink');
INSERT INTO Tagms.product_Category(Name, Description) VALUES
('Juice','Juice is a drink made from the extraction or pressing of the natural liquid contained in fruit and vegetables') ;
INSERT INTO Tagms.product_Category(Name, Description) VALUES
('Smoothie','Smoothie is a drink made by pur�eing fruit and vegetables in a blender') ;

-- Product
INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
('Blonde beer','Blonde beer description', '1.00', '2.0', '1', '1', '1', 'Calories: 153, Alcohol: 14 grams, Carbs: 13 grams,Protein: 2 grams, Fat: 0 grams.', '1');
INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
('Coke','Coke', '1.00', '2.0', '1', '1', '1', 'Calories: 153, Alcohol: 0 grams, Carbs: 13 grams,Protein: 2 grams, Fat: 0 grams.', '2');
INSERT INTO Tagms.product(Name, Description, Production_cost, Price_increase, Volume, Net_weight, Package_weight, Nutritional_Facts, Product_Category_ID)  VALUES
('Juice','Juice', '1.00', '2.0', '1', '1', '1', 'Calories: 153, Alcohol: 0 grams, Carbs: 13 grams,Protein: 2 grams, Fat: 0 grams.', '3');

-- TODO: Check if works
-- Made_Up_Of_1
INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('1234','11','10'), ('1234','12','5'), ('1234','13','2');

-- TODO: Check if works
-- Package
INSERT INTO Tagms.package(Package_ID, Name, Description, Weight, Height, Width, Depth, 
Package_Category_ID) VALUES
('001', 'Aluminum cans', 'Aluminum cans 0.33L', '2', '5', '3', '3', '01')
('002', 'Bottle', 'Plastic bottle 0,75L ', '3', '6', '3', '3', '02')
('003', 'Bottle', 'Plastic bottle 0.5L ', '3', '6', '3', '3', '02')
('004', 'Bottle', 'Glass bottle 0.75L ', '3', '8', '3', '3', '03')
('004', 'Bottle', 'Glass bottle 1L ', '3', '10', '3', '3', '03');

-- TODO: Check if works
-- Package_Category
INSERT INTO Tagms.package_Category(Name, Description) VALUES
('PCKXS','Package XS');

INSERT INTO Tagms.package_Category(Name, Description) VALUES
('PCKS','Package S');

INSERT INTO Tagms.package_Category(Name, Description) VALUES
('PCKM','Package M');

INSERT INTO Tagms.package_Category(Name, Description) VALUES
('PCKL','Package L');

INSERT INTO Tagms.package_Category(Name, Description) VALUES
('PCKXL','Package XL');

-- TODO: Check if works
-- Made_Up_Of_2
INSERT INTO Tagms.made_Up_Of_2(Package_ID, Item_ID, Quantity) VALUES
('454','15','4');
('14','129','300');


-- TODO: Check if works
-- Lot
INSERT INTO Tagms.lot(Lot_ID, Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity, 
Package_Quantity,Package_ID, Product_ID) VALUES 
('3334', '2022-03-14','0.3','44576685449', '330.50', '50', '10','337', '13');

-- TODO: Check if works
-- Draws_from
INSERT INTO Tagms.draws_from(Lot_ID, Order_ID) VALUES 
('22443','4445');
('150','39');