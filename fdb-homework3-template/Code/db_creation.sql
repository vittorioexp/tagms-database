
-- Database Creation
CREATE DATABASE tagmsdb OWNER admin ENCODING = 'UTF8';

-- Create new Schema (you can use the public schema without creating a new one, if you want)
DROP SCHEMA IF EXISTS Tagms CASCADE;
CREATE SCHEMA Tagms;

-- Create new domains
CREATE DOMAIN Tagms.emailaddress AS VARCHAR(255)
CONSTRAINT properemail CHECK (VALUE ~ '^[A-Za-z0-9._%]+@[A-Za-z0-9.]+[.][A-Za-z]+$');

-- checks for the italian number structure w/ or w/o prefix
CREATE DOMAIN Tagms.phonenumber AS VARCHAR(17)
CONSTRAINT properphonenumber CHECK (VALUE ~ '^(\((00|\+)39\)|(00|\+)39)?3\d{9}$');

CREATE DOMAIN Tagms.vatnumber AS CHAR(11)
CONSTRAINT properVAT CHECK (VALUE ~ '^[0-9]{11}$');

CREATE DOMAIN Tagms.taxnumber AS CHAR(16)
CONSTRAINT propertaxnumber CHECK (VALUE ~ '^[A-Z]{6}\d{2}[A-Z]\d{2}[A-Z]\d{3}[A-Z]$');


CREATE DOMAIN Tagms.price AS NUMERIC(9, 3)
CONSTRAINT properprice NOT NULL CHECK (VALUE > 0.0);

CREATE DOMAIN Tagms.quantity AS INTEGER
CONSTRAINT properquantity NOT NULL CHECK (VALUE >= 1);

CREATE DOMAIN Tagms.dimension AS INTEGER
CONSTRAINT properdimension NOT NULL CHECK (VALUE > 0);

CREATE DOMAIN Tagms.percentage AS DECIMAL(4,1)
CONSTRAINT properpercentage CHECK (VALUE >= 0 and VALUE <= 100);

CREATE DOMAIN Tagms.tracknum AS VARCHAR(30)
CONSTRAINT propertracknum CHECK(VALUE ~ '[A-Za-z0-9]');

-- Table Creation (create tables in the correct order, i.e. use FKeys only referring to already created tables)

CREATE TABLE Tagms.product_category (
product_category_id SMALLSERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
description VARCHAR(500)
);

CREATE TABLE Tagms.item_category (
item_category_id SMALLSERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
description VARCHAR(500)
);

CREATE TABLE Tagms.package_category (
package_category_id SMALLSERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
description VARCHAR(500)
);

CREATE TABLE Tagms.product (
product_id SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
description VARCHAR(500),
production_cost Tagms.price,
price_increase Numeric(3, 1) NOT NULL CHECK (price_increase >= 1),
volume Tagms.dimension,
net_weight Tagms.dimension,
package_weight Tagms.dimension,
nutritional_facts VARCHAR(500) NOT NULL,
product_category_id SMALLINT NOT NULL,
FOREIGN KEY (product_category_id) REFERENCES Tagms.product_category(product_category_id)
);

CREATE TABLE Tagms.item (
item_id SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
description VARCHAR(500),
quantity Tagms.quantity,
minimum_quantity Tagms.quantity,
item_category_id SMALLINT NOT NULL,
FOREIGN KEY (item_category_id) REFERENCES Tagms.item_category(item_category_id)
);

CREATE TABLE Tagms.package (
package_id SMALLSERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
description VARCHAR(500),
weight Tagms.dimension,
height Tagms.dimension,
width Tagms.dimension,
depth Tagms.dimension,
package_category_id SMALLINT NOT NULL,
FOREIGN KEY (package_category_id) REFERENCES Tagms.package_category(package_category_id)
);

CREATE TABLE Tagms.lot (
lot_id SERIAL PRIMARY KEY,
expiration_date DATE NOT NULL,
product_id INTEGER NOT NULL,
product_quantity Tagms.quantity,
package_id INTEGER NOT NULL,
package_quantity Tagms.quantity,
lot_discount Tagms.percentage  NOT NULL,
vat Tagms.percentage NOT NULL,
lot_price Tagms.price,
FOREIGN KEY (package_id) REFERENCES Tagms.package(package_id),
FOREIGN KEY (product_id) REFERENCES Tagms.product(product_id)
);

CREATE TABLE Tagms.made_up_of_1 (
product_id INTEGER,
item_id INTEGER,
quantity Tagms.quantity,
FOREIGN KEY (product_id) REFERENCES Tagms.product(product_id),
FOREIGN KEY (item_id) REFERENCES Tagms.item(item_id),
PRIMARY KEY (product_id, item_id)
);

CREATE TABLE Tagms.made_up_of_2 (
package_id INTEGER,
item_id INTEGER,
quantity Tagms.quantity,
FOREIGN KEY (package_id) REFERENCES Tagms.package(package_id),
FOREIGN KEY (item_id) REFERENCES Tagms.item(item_id),
PRIMARY KEY (package_id, item_id)
);

CREATE TABLE Tagms.customer (
vat_number Tagms.vatnumber PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
phone_number Tagms.phonenumber NOT NULL,
address VARCHAR(100) NOT NULL,
email_address Tagms.emailaddress NOT NULL,
registration_date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Tagms.role (
role_id SMALLSERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
description VARCHAR(500)
);

CREATE TABLE Tagms.employee (
tax_number Tagms.taxnumber PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
phone_number Tagms.phonenumber NOT NULL,
email_address Tagms.emailaddress NOT NULL,
birth_date DATE,
hiring_date DATE NOT NULL,
still_working BOOLEAN NOT NULL,
role_id SMALLINT NOT NULL,
FOREIGN KEY (role_id) REFERENCES Tagms.role(role_id)
);

CREATE TABLE Tagms.department (
department_id SMALLSERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
description VARCHAR(500)
);

CREATE TABLE Tagms.work (
department_id SMALLINT,
employee_id Tagms.taxnumber,
FOREIGN KEY (department_id) REFERENCES Tagms.department(department_id),
FOREIGN KEY (employee_id) REFERENCES Tagms.employee(tax_number),
PRIMARY KEY (department_id, employee_id)
);

CREATE TABLE Tagms.supplier (
vat_number Tagms.vatnumber PRIMARY KEY,
supplier_name VARCHAR(50) NOT NULL,
phone_number Tagms.phonenumber NOT NULL,
email_address Tagms.emailaddress NOT NULL,
address VARCHAR(100) NOT NULL,
registration_date TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE Tagms.contract (
contract_id SERIAL PRIMARY KEY,
description VARCHAR(500),
contract_date DATE NOT NULL DEFAULT CURRENT_DATE,
delivery_date DATE NOT NULL,
expiration_date DATE NOT NULL,
supplier_id Tagms.vatnumber NOT NULL,
employee_id Tagms.taxnumber NOT NULL,
FOREIGN KEY (supplier_id) REFERENCES Tagms.supplier(vat_number),
FOREIGN KEY (employee_id) REFERENCES Tagms.employee(tax_number)
);

CREATE TABLE Tagms.specify (
item_id INTEGER,
contract_id INTEGER,
price Tagms.price,
purchased_quantity Tagms.quantity,
FOREIGN KEY (item_id) REFERENCES Tagms.item(item_id),
FOREIGN KEY (contract_id) REFERENCES Tagms.contract(contract_id),
PRIMARY KEY (item_id, contract_id)
);

CREATE TABLE Tagms.order (
order_id SERIAL PRIMARY KEY,
net_price Tagms.price,
taxes Tagms.price,
order_date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
order_paid BOOLEAN NOT NULL,
employee_id Tagms.taxnumber NOT NULL,
customer_id Tagms.vatnumber NOT NULL,
FOREIGN KEY (employee_id) REFERENCES Tagms.employee(tax_number),
FOREIGN KEY (customer_id) REFERENCES Tagms.customer(vat_number)
);

CREATE TABLE Tagms.draws_from (
lot_id INTEGER PRIMARY KEY,
order_id INTEGER NOT NULL,
FOREIGN KEY (lot_id) REFERENCES Tagms.lot(lot_id),
FOREIGN KEY (order_id) REFERENCES Tagms.order(order_id)
);

CREATE TABLE Tagms.ship (
order_id INTEGER PRIMARY KEY,
employee_id Tagms.taxnumber NOT NULL,
shipping_date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
track_num Tagms.tracknum,
FOREIGN KEY (order_id) REFERENCES Tagms.order(order_id),
FOREIGN KEY (employee_id) REFERENCES Tagms.employee(tax_number)
);



