/*Transaction  with save points and roll back for insert values into insurance and insurance payment tables*/
START TRANSACTION;

SAVEPOINT before_insert_insurance;

INSERT INTO insurance
	VALUES (55, 'BCBS', '01A', '243Q', 26);
    
SAVEPOINT before_insert_insurance_payment;

INSERT INTO insurance_payment
	VALUES (29, 567.98, '2020-11-30 11:59:59');
    
SELECT *
FROM insurance_change;
SELECT *
FROM insurance_payment_change;

ROLLBACK TO SAVEPOINT before_insert_insurance_payment;
ROLLBACK TO SAVEPOINT before_insert_insurance;
COMMIT;

SELECT *
FROM insurance_change;
SELECT *
FROM insurance_payment_change;

/*Transaction with savepoints on update, delete values for appointment, account_balance*/  
START TRANSACTION;

SAVEPOINT before_update_appointment;

UPDATE appointment
SET ap_date = '2020-10-28 10:00:00'
WHERE appointmentID = 23;

SAVEPOINT before_delete_appointment;

DELETE
FROM appointment 
WHERE appointmentID = 23;

SAVEPOINT before_update_account_balance;

UPDATE account_balance
SET amount = 2345.67
WHERE accountID = 7;

SAVEPOINT before_delete_account_balance;

DELETE
FROM account_balance 
WHERE accountID = 7;
    
SELECT *
FROM appointment_date_change;
SELECT *
FROM account_balance_change;

ROLLBACK TO SAVEPOINT before_delete_account_balance;
ROLLBACK TO SAVEPOINT before_update_account_balance;
ROLLBACK TO SAVEPOINT before_delete_appointment;
ROLLBACK TO SAVEPOINT before_update_appointment;
COMMIT;

SELECT *
FROM appointment_date_change;
SELECT *
FROM account_balance_change;

/*Transaction with savepoints on update, delete patient information*/
START TRANSACTION;
        
SAVEPOINT before_update_patient;

UPDATE patient
SET ssn = 349089855
WHERE patientID = 3;

SAVEPOINT before_delete_patient;

DELETE
FROM patient
WHERE patientID = 3;

SELECT *
FROM patient_change;

ROLLBACK TO SAVEPOINT before_delete_patient;
ROLLBACK TO SAVEPOINT before_update_patient;
COMMIT;

SELECT *
FROM patient_change;

/*Transaction with savepoints on insert, update, delete adress information*/
START TRANSACTION;
SAVEPOINT before_insert_adress;

INSERT INTO adress VALUES (239, 'Grand Alley', '123A', '', 'Gastonia', 'SC', 27204);
        
SAVEPOINT before_update_adress;

UPDATE adress
SET state = 'NC'
WHERE adressID = 239;

SAVEPOINT before_delete_adress;

DELETE
FROM adress
WHERE adressID = 239;
    
SELECT *
FROM adress_change;

ROLLBACK TO SAVEPOINT before_delete_adress;
ROLLBACK TO SAVEPOINT before_update_adress;
ROLLBACK TO SAVEPOINT before_insert_adress;
COMMIT;

SELECT *
FROM adress_change;



