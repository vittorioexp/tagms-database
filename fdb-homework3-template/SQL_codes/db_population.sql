
-- Employee
insert into tagms.employee values ('DKLERT23D96A316T','Mario','Rossi','00393316986532','mariorossi@gmail.com','1953-07-24','2017-09-14','true',1);
insert into tagms.employee values ('MHVHQK62H26L404I','Luca','Neri','(+39)3808743120','lucaneri@gmail.com','1959-01-15','2015-05-07','true',1);
insert into tagms.employee values ('LGNLVT85M04C227R','Paolo','Verdi','(0039)3405561897','paoloverdi@gmail.com','1976-08-10','2019-06-20','true',4);



-- Role

INSERT INTO Tagms.role(Name,Description) VALUES 
('Manager','The managers are in charge of interacting with suppliers and concluding contracts with them');

INSERT INTO Tagms.role(Name,Description) VALUES 
('Worker','The workers take care of production and shipments');

INSERT INTO Tagms.role(Name,Description) VALUES 
('Salesman','The sellers have to deal with customers and create orders');

INSERT INTO Tagms.role(Name,Description) VALUES 
('Data Analyst','The data analyst has access to the acquired data for inventory, cost and profit analysis');



-- Employee

INSERT INTO Tagms.employee(TAX_number, First_name, Last_name, Phone_number, Email_address,
Birth_date, Hiring_date, Still_working, Role_ID) VALUES
('FGDVSF30C62D012T','John','Smith','3516921849','johnsmith@gmail.com','1995-12-30',
'2018-12-12','true','01');

INSERT INTO Tagms.employee(TAX_number, First_name, Last_name, Phone_number, Email_address,
Birth_date, Hiring_date, Still_working, Role_ID) VALUES
('FGDVSF40C62D012T','Adam','Willis','3516931849','adamwillis@gmail.com','1993-11-20',
'2019-11-11','true','02');

INSERT INTO Tagms.employee(TAX_number, First_name, Last_name, Phone_number, Email_address,
Birth_date, Hiring_date, Still_working, Role_ID) VALUES
('HGDVSF40C62D012T','Bruce','De Forest','3516931649','deforest@gmail.com','1992-11-20',
'2012-11-11','true','03');

INSERT INTO Tagms.employee(TAX_number, First_name, Last_name, Phone_number, Email_address,
Birth_date, Hiring_date, Still_working, Role_ID) VALUES
('HGSVSF40C62D012T','Elena','Zapi','3516931649','zapi@gmail.com','1998-11-20',
'2012-11-11','true','04');

INSERT INTO Tagms.employee(TAX_number, First_name, Last_name, Phone_number, Email_address,
Birth_date, Hiring_date, Still_working, Role_ID) VALUES
('DKLERT23D96A316T','Mario','Rossi','00393316986532','mariorossi@gmail.com','1953-07-24','2017-09-14','true',1);

INSERT INTO Tagms.employee(TAX_number, First_name, Last_name, Phone_number, Email_address,
Birth_date, Hiring_date, Still_working, Role_ID) VALUES
('DKLERT23D96A316T','Mario','Rossi','00393316986532','mariorossi@gmail.com','1953-07-24','2017-09-14','true',1);

INSERT INTO Tagms.employee(TAX_number, First_name, Last_name, Phone_number, Email_address,
Birth_date, Hiring_date, Still_working, Role_ID) VALUES
('DKLERT23D96A316T','Mario','Rossi','00393316986532','mariorossi@gmail.com','1953-07-24','2017-09-14','true',1);


-- Work

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES 
('1','FGDVSF30C62D012T');

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES 
('1','FGDVSF40C62D012T');

INSERT INTO Tagms.work(Department_ID, Employee_ID) VALUES 
('1','HGDVSF40C62D012T');



-- Departament

INSERT INTO Tagms.department(Name, Description) VALUES ('Operations','Responsible for converting raw materials and packaging materials into finished goods and work to improve the efficiency of the production.');

INSERT INTO Tagms.department(Name, Description) VALUES ('Sales','Responsible for the sale of lots.');

INSERT INTO Tagms.department(Name, Description) VALUES ('Administration','Responsible for the administration of the accounting of employment contracts and management of personnel, customers and suppliers.');

INSERT INTO Tagms.department(Name, Description) VALUES ('Maintenance','Department responsible for the management and maintenance of the different machinery used for production.');

INSERT INTO Tagms.department(Name, Description) VALUES ('Shipping','Responsible for marking and shipping lots.');

-- Ship

INSERT INTO Tagms.ship(Order_ID, Employee_ID, Shipping_date,Track_num) VALUES 
('9123','21123','2022-27-11','ZXU098123');



--Supplier
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

-- Contract
insert into tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) values ('contract with supplier 1','2020-01-18','2021-12-06','2023-12-31',16835498612,'DKLERT23D96A316T')
insert into tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) values ('contract with supplier 1','2021-02-01','2021-12-08','2024-12-31',16835498612,'MHVHQK62H26L404I')
insert into tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) values ('contract with supplier 2','2019-01-25','2021-12-07','2022-12-31',16835498612,'MHVHQK62H26L404I');


-- Item
INSERT INTO Tagms.item(item_id, name, description, quantity, minimum_quantity, item_category_id) VALUES 
('85234','Cola','Drink_Cola','100','10','48');

-- Item_Category
INSERT INTO Tagms.item_Category(item_category_id, name, description) VALUES
('23','Drink','Drink_Category');

-- Specify
INSERT INTO Tagms.specify(item_id, contract_id, price, purchased_quantity) VALUES
('45213','74125','14.50','100');

-- Product
INSERT INTO Tagms.product(Product_ID, Name, Description, Product_cost, Price_increase,
Volume, Net_weight, Nutritional_Facts, Product_Category_ID)  VALUES 
('1234', 'Blonde beer','Blonde beer', '1.00', '2','1', '1', 'Calories: 153, 
Alcohol: 14 grams, Carbs: 13 grams,Protein: 2 grams, Fat: 0 grams.', 22)
('1235', 'Coke','Coke', '0.50', '1','1', '1', 'Calories: 153, 
Alcohol: 0 grams, Carbs: 13 grams,Protein: 2 grams, Fat: 0 grams.', 11)
('1236', 'Juice','Juice', '1.50', '2','1', '1', 'Calories: 153, 
Alcohol: 0 grams, Carbs: 13 grams,Protein: 2 grams, Fat: 0 grams.', 33);

-- Product_Category
INSERT INTO Tagms.product_Category(Product_Category_ID, Name, Description) VALUES 
('22','Beer','An alcoholic beverage typically obtained from the fermentation of wort based on barley malt')
('11','Coke','Coca-Cola, or Coke, is a carbonated soft drink')
('33','Juice','Juice is a drink made from the extraction or pressing of the natural liquid contained in fruit and vegetables') ;

-- Made_Up_Of_1
INSERT INTO Tagms.made_Up_Of_1(Product_ID, Item_ID,Quantity) VALUES
('1234','11','10'), ('1234','12','5'), ('1234','13','2');


-- Package
INSERT INTO Tagms.package(Package_ID, Name, Description, Weight, Height, Width, Depth, 
Package_Category_ID) VALUES
('001', 'Aluminum cans', 'Aluminum cans 0.33L', '2', '5', '3', '3', '01')
('002', 'Bottle', 'Plastic bottle 0,75L ', '3', '6', '3', '3', '02')
('003', 'Bottle', 'Plastic bottle 0.5L ', '3', '6', '3', '3', '02')
('004', 'Bottle', 'Glass bottle 0.75L ', '3', '8', '3', '3', '03')
('004', 'Bottle', 'Glass bottle 1L ', '3', '10', '3', '3', '03');

-- Package_Category
INSERT INTO Tagms.package_Category(Package_Category_ID, Name, Description) VALUES 
('01','Cans','Aluminum cans ')
('02','Bottle','Plastic bottle')
('03','Bottle','Glass bottle');

-- Made_Up_Of_2
INSERT INTO Tagms.made_Up_Of_2(Package_ID, Item_ID, Quantity) VALUES
('454','15','4');
('14','129','300');


-- Order
INSERT INTO Tagms.order(Order_ID,Net_price, Taxes, Order_date, Order_paid, Employee_ID, 
Customer_ID) VALUES 
('25467','230.20', '23.02', '2021-12-04 17:30:00', 'true', 'MPHFLH77C48H362N', '86334519757')
('30045','356.26', '13.59', '2021-12-04 12:00:22', 'true', 'CTXVNN28L17D605N', '86345837378')

-- Customer
INSERT INTO Tagms.customer(VAT_numeber, Customer_name, Registration_date, Address, 
Email_address, Phone_number) VALUES
('23859476254', 'Mario Rossi', '2020-04-11 11:03:40','Via Milano 5 35121 Padova', 'mariorossi@gmail.com', '3342856738')
('88756400811', 'Giovanni Bianchi', '2010-11-20 09:07:10','Via Milano 5 35131 Padova', 'giovanniverdi4@unipd.it', '3119385864')

-- Lot
INSERT INTO Tagms.lot(Lot_ID, Expiration_date,Lot_discount,VAT, Lot_price, Product_Quantity, 
Package_Quantity,Package_ID, Product_ID) VALUES 
('3334', '2022-03-14','0.3','44576685449', '330.50', '50', '10','337', '13');

-- Draws_from
INSERT INTO Tagms.draws_from(Lot_ID, Order_ID) VALUES 
('22443','4445');
('150','39');