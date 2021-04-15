/*Patient table*/
ALTER TABLE patient AUTO_INCREMENT = 1;
INSERT INTO patient (first_name, last_name, gender, date_of_birth, email, 
					phone, ssn, insuranceID, medical_recordID, accountID, adressID)
VALUES ('Ashley', 'Nickolson', 'F', '1995-05-26', 'ashley.nickolson@gmail.com', '705-605-4565',
		123567889, 45, 3, 2, 231),
		('Mike', 'Piterson', 'M', '1980-01-05', 'mike.piterson@gmail.com', '904-807-2345',
        567893408, 39, 4, 5, 432),
        ('Kris', 'Week', 'M', '1973-12-01', 'kris.week@gmail.com', '203-405-7689',
        349056781, 87, 6, 3, 123),
        ('Lola', 'Lee', 'F', '1954-08-28', 'lola.lee@gmail.com', '706-507-3458',
        589457230, 123, 1, 7, 34),
        ('Dean', 'Jeen', 'M', '1945-07-30', NULL, '604-345-2134',
        890345819, 67, 2, 1, 87),
        ('Joan', 'Pule', 'F', '1998-11-05', 'joan.pule@gmail.com', '604-908-7865',
        923407648, 90, 5, 6, 203),
        ('Olive', 'Poter', 'M', '2005-09-09', NULL, '405-608-3489',
        506983428, 94, 7, 4, 94);

SELECT*
FROM patient;

/*Adress table*/
INSERT INTO adress (adressID, streat, building, apartment, city, state, zip_code)
VALUES (231, 'Grand Alley', '123A', '', 'Gastonia', 'SC', 27204),
		(432, 'University St', '45', '', 'Charlotte', 'NC', 28209),
        (123, 'Ashley', '23B', '121', 'Anchoridge', 'AL', 45098),
        (34, 'New St', '604', '11', 'Huntersville', 'NC', 28045),
        (87, 'Old Road', '28-B', '', 'New Jercy', 'SC', 27056),
        (203, 'Milky Way', '3', '23', 'New York', 'NY', 34098),
        (94, 'Tyvola Road', '9A', '145', 'Charlotte', 'NC', 28408);

SELECT*
FROM adress;

/*Billing table*/
ALTER TABLE billing AUTO_INCREMENT=1;

INSERT INTO billing (amount, balance, billing_date)
VALUES (154.2, 457.2, '2020-10-05'),
		(546.5, 894.4, '2020-09-11'),
        (326, 326, '2020-08-23'),
        (789.3, 1543.3, '2020-09-28'),
        (298.8, 298.8, '2020-08-06'),
        (985.9, 3567.7, '2020-09-30'),
        (123, 123, '2020-10-25');

SELECT *
FROM billing;

/*Account_balance table*/
ALTER TABLE account_balance AUTO_INCREMENT=1;

INSERT INTO account_balance(amount, account_balance_date, billingID)
VALUES (576.89, '2020-10-30 16:43:25', 1),
		(1156.98, '2020-09-20 09:12:56', 2),
        (734, '2020-08-28 15:03:57', 3),
        (1345.67, '2020-10-12 17:56:01', 4),
        (189, '2020-10-01 12:34:33', 5),
        (5783.23, '2020-10-25 13:23:56', 6),
        (346.45, '2020-10-26 18:02:34', 7);

SELECT*
FROM account_balance;

/*Insurance table*/
INSERT INTO insurance(insuranceID, provider, group_number, subscriber_number, insurance_paymentID)
VALUES (45, 'BlueCrossBlueShield', '01A', '243Q', 26),
		(67, 'Atrium', '00', '012B', 256),
        (87, 'StateFarm', '23', '101A', 136),
        (94, 'BCBS', '03B', '045', 345),
        (123, 'Atrium', '11', '05A', 129),
        (90, 'AllState', '01B', '421', 126),
        (39, 'StateFarm', '1C', '07', 453);
        
SELECT*
FROM insurance;

/*Insurance_payment table*/
INSERT INTO insurance_payment (insurance_paymentID, amount, payment_date)
VALUES (26, 567.98, '2020-11-30 11:59:59'),
		(256, 457.67, '2020-11-30 11:59:59'),
        (136, 1567.45, '2020-10-12 11:59:59'),
        (345, 456.89, '2020-09-17 11:59:59'),
        (129, 2367, '2020-10-19 11:59:59'),
        (126, 3456, '2020-11-30 11:59:59'),
        (453, 123.98, '2020-10-02 11:59:59');
        
SELECT*
FROM insurance_payment;

/*Insurance_payment_billing table*/
INSERT INTO insurance_payment_billing (insurance_paymentID, billingID)
VALUES (26, 4),
		(256, 1),
        (136, 7),
        (345, 3),
        (129, 6),
        (126, 2),
        (453,5);
        
SELECT*
FROM insurance_payment_billing;

/*Symptoms table*/
ALTER TABLE symptoms AUTO_INCREMENT = 1;
INSERT INTO symptoms (symptoms)
VALUES ('toothache'),
		('loose teeth'),
        ('receding gums'),
        ('pain with chewing'),
        ('sudden sensitivity'),
        ('bleeding'),
        ('swollen gums');

SELECT*
FROM symptoms;

/*Prescription table*/
ALTER TABLE prescription AUTO_INCREMENT = 1;
INSERT INTO prescription (prescription_name, brand, prescription_date)
VALUES ('Azithromycin', 'MAX', '2020-10-13 11:00:00'),
		('Z-Pak', 'LOSS', '2020-09-30 15:15:00'),
        ('Benzocaine', 'UMM', '2020-11-10 09:30:00'),
        ('Jydrogen peroxide', 'TAH', '2020-10-30 13:15:00'),
        ('Denti-Care Denti-Freeze', 'REE', '2020-11-09 08:00:00');

SELECT*
FROM prescription;

/*Diagnosis table*/
ALTER TABLE diagnosis AUTO_INCREMENT = 1;
INSERT INTO diagnosis(diagnosis)
VALUES ('Gingivitis'),
		('Periodontitis'),
        ('Advanced Periodontitis');
        
SELECT*
FROM diagnosis;

/*Medical_record table*/
ALTER TABLE medical_record AUTO_INCREMENT = 1;
INSERT INTO medical_record (symptomsID, diagnosisID, prescriptionID)
VALUES (1, 2, 4),
		(2, 1, 3),
        (3, 3, 5),
        (4, 1, 2),
        (5, 2, 1),
        (6, 3, 4),
        (7, 2, 5);

SELECT*
FROM medical_record;

/*Dentist table*/
ALTER TABLE dentist AUTO_INCREMENT = 1;
INSERT INTO dentist (first_name, last_name, dentist_position)
VALUES ('Mickle', 'Jameson', 'General Dentist'),
		('Alison', 'MC Cortney', 'Orthodontist'),
        ('Witney', 'Kley', 'Oral Surgeon'),
        ('Piter', 'Qeen', 'General Dentist'),
        ('Alex', 'Wisely', 'Periodontist'),
        ('Zack', 'Kontley', 'Oral Surgeon'),
        ('Olive', 'Orlee', 'General Dentist'),
        ('Kris', 'Qee', 'Orthodontist');
        
SELECT*
FROM dentist;

/*Dentist_assistant table*/
ALTER TABLE dentist_assistant AUTO_INCREMENT = 1;
INSERT INTO dentist_assistant (first_name, last_name)
VALUES ('Max', 'Walkey'),
		('Alison', 'Reed'),
        ('Brithney', 'Dallos'),
        ('Ostin', 'Prince'),
        ('Jack', 'Hue');
SELECT*
FROM dentist_assistant;

/*Procedures table*/
ALTER TABLE procedures AUTO_INCREMENT = 1;
INSERT INTO procedures (procedure_name, cost, dentistID, dentist_assistantID)
VALUES ('Fillings and repairs', 345.45, 8, 3),
		('Fillings and repairs', 345.45, 2, 3),
		('Crowns and caps', 895, 5, 2),
        ('Tooth extractions', 567.43, 7, 1),
        ('Tooth extractions', 567.43, 3, 4),
        ('Implants', 2345, 6, 1),
        ('Implants', 2345, 3, 4),
        ('Braces', 1234.45, 1, 5),
        ('Braces', 1234.45, 4, 5),
        ('Braces', 1234.45, 7, 3),
        ('Teeth Whitening', 356, 1, 3),
        ('Teeth Whitening', 356, 4, 2),
        ('Teeth Whitening', 356, 7, 4),
        ('Veneers', 1567, 6, 4),
        ('Veneers', 1567, 3, 1),
        ('Root canals', 589.09, 5, 2);
        
SELECT*
FROM procedures;

/*Appointment table*/
INSERT INTO appointment (appointmentID, ap_date, procedureID, patientID)
VALUES (23, '2020-10-28 08:15:00', 1, 4),
		(56, '2020-10-11 13:00:00', 4, 3),
        (67, '2020-10-11 13:30:00', 8, 1),
        (48, '2020-10-11 15:45:00', 7, 2),
        (76, '2020-11-03 09:00:00', 2, 5),
        (84, '2020-11-17 15:15:00', 10, 6),
        (96, '2020-12-01 10:30:00', 6, 1),
        (145, '2020-10-29 18:00:00', 3, 3),
        (108, '2020-11-30 11:45:00', 5, 7),
        (112, '2020-12-15 12:00:00', 9, 5),
        (115, '2020-12-12 08:00:00', 11, 3),
        (45, '2020-10-13 16:45:00', 14, 2),
        (86, '2020-11-13 17:30:00', 12, 4),
        (35, '2020-10-05 11:30:00', 15, 1),
        (89, '2020-10-30 09:30:00', 13, 6),
        (98, '2020-11-29 14:00:00', 16, 3);
        
SELECT*
FROM appointment
ORDER BY ap_date ASC;

