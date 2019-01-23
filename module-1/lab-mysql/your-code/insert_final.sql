ALTER TABLE cars MODIFY vin VARCHAR(45);
ALTER TABLE customer MODIFY phone_number VARCHAR(45);

INSERT INTO cars (vin, manufacturer, model, car_year, color, invoice_invoice_number,customer_customer_id)
 VALUES 
('3K096I98581DHSNUP', 'Volkswagen','Tiguan', 2019, 'blue',852399038,20001),
('ZM8G7BEUQZ97IH46V', 'Peugeot',	'Rifter',	2019,	'Red', 0, 0),
('RKXVNNIHLVVZOUB4M',	'Ford', 'Fusion',	2018,	'White', 271135104, 30001),
('HKNDGS7CU31E9Z7JW',	'Toyota',	'RAV4',	2018,	'Silver', 731166526, 10001),
('DAM41UDN3CHU2WVF6',	'Volvo',	'V60',	2019, 'Gray', 0, 0),
('DAM41UDN3CHU2WVF6',	'Volvo',	'V60 Cross Country',	2019, 'Gray', 0, 0);

INSERT INTO salesperson (salesperson_id, salesperson_name, store) 
VALUES (00001,	'Petey Cruiser',	'Madrid'),(00002,	'Anna Sthesia',	'Barcelona'),(00003,	'Paul Molive',	'Berlin'),(00004,	'Gail Forcewind',	'Paris'),(00005,	'Paige Turner',	'Mimia'),(00006,	'Bob Frapples',	'Mexico City'),(00007,	'Walter Melon',	'Amsterdam'),(00008,	'Shonda Leer',	'São Paulo');

INSERT INTO customers (customer_id, customer_name, phone_number,email,address,city,state/province, country, zip/postal, salesperson_salesperson_id) 
VALUES (10001,	'Pablo Picasso',	'+34 636 17 63 82',	'-',	'Paseo de la Chopera, 14',	'Madrid',	'Madrid',	'Spain',	28045, 00006),
(20001,	'Abraham Lincoln',	'+1 305 907 7086',	'-',	'120 SW 8th St',	'Miami',	'Florida',	'United States',	33130, 00004),
(30001,	'Napoléon Bonaparte',	'+33 1 79 75 40 00',	'-',	'40 Rue du Colisée',	'Paris',	'Île-de-France',	'France',	75008, 00008 );
