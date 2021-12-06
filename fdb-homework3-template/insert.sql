insert into tagms.employee values ('DKLERT23D96A316T','Mario','Rossi','00393316986532','mariorossi@gmail.com','1953-07-24','2017-09-14','true',1);
insert into tagms.employee values ('MHVHQK62H26L404I','Luca','Neri','(+39)3808743120','lucaneri@gmail.com','1959-01-15','2015-05-07','true',1);
insert into tagms.employee values ('LGNLVT85M04C227R','Paolo','Verdi','(0039)3405561897','paoloverdi@gmail.com','1976-08-10','2019-06-20','true',4);

insert into tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) values ('contract with supplier 1','2020-01-18','2021-12-06','2023-12-31',16835498612,'DKLERT23D96A316T');
insert into tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) values ('contract with supplier 1','2021-02-01','2021-12-08','2024-12-31',16835498612,'MHVHQK62H26L404I');
insert into tagms.contract (description,contract_date,delivery_date,expiration_date,supplier_id,employee_id) values ('contract with supplier 2','2019-01-25','2021-12-07','2022-12-31',16835498612,'MHVHQK62H26L404I');