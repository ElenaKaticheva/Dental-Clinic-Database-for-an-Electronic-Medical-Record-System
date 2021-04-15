/*Trigger gives information of updated, inserted, and deleted patients*/
DROP TABLE IF EXISTS patient_change;

CREATE TABLE patient_change
(patientID INT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  gender VARCHAR(10) NOT NULL,
  date_of_birth DATE NOT NULL,
  email VARCHAR(50) NULL DEFAULT NULL,
  phone VARCHAR(50) NOT NULL,
  ssn CHAR(9) NULL DEFAULT NULL,
  insuranceID INT NOT NULL,
  medical_recordID INT NOT NULL,
  accountID INT NOT NULL,
  adressID INT NOT NULL,
  action_type VARCHAR(50) NOT NULL,
  action_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  vUser VARCHAR(50)
);

DROP TRIGGER IF EXISTS patient_after_insert;
DROP TRIGGER IF EXISTS patient_after_delete;
DROP TRIGGER IF EXISTS patient_after_update;

DELIMITER //

CREATE TRIGGER patient_after_insert
  AFTER INSERT ON patient
  FOR EACH ROW
BEGIN
	DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO patient_change VALUES
    (NEW.patientID, NEW.first_name, NEW.last_name, NEW.gender, NEW.date_of_birth, NEW.email, NEW.phone, 
    NEW.ssn, NEW.insuranceID, NEW.medical_recordID, NEW.accountID, NEW.adressID, 
    'INSERTED', NOW(), vUser);
END//

CREATE TRIGGER patient_after_delete
  AFTER DELETE ON patient
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO patient_change VALUES
    (OLD.patientID, OLD.first_name, OLD.last_name, OLD.gender, OLD.date_of_birth, OLD.email, OLD.phone, 
    OLD.ssn, OLD.insuranceID, OLD.medical_recordID, OLD.accountID, OLD.adressID, 
    'DELETED', NOW(), vUser);
END//

CREATE TRIGGER patient_after_update
  AFTER UPDATE ON patient
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO patient_change VALUES
    (OLD.patientID, OLD.first_name, OLD.last_name, OLD.gender, OLD.date_of_birth, OLD.email, OLD.phone, 
    OLD.ssn, OLD.insuranceID, OLD.medical_recordID, OLD.accountID, OLD.adressID, 
    'UPDATED', NOW(), vUser);
END//


ALTER TABLE patient AUTO_INCREMENT = 1;
INSERT INTO patient(first_name, last_name, gender, date_of_birth, email, 
					phone, ssn, insuranceID, medical_recordID, accountID, adressID)
		VALUES ('Leo', 'Lee', 'M', '1984-08-30', 'leo.lee@gmail.com', '706-507-3458',
        589457230, 123, 1, 7, 34);


UPDATE patient
SET ssn = 589457237
WHERE patientID = 13;

DELETE FROM patient WHERE patientID = 13;

SELECT * 
FROM patient_change;

/*Trigger gives information of updated, inserted, and deleted prescription*/
DROP TABLE IF EXISTS prescription_change;

CREATE TABLE prescription_change
(prescriptionID INT,
  prescription_name VARCHAR(50) NOT NULL,
  brand VARCHAR(50) NOT NULL,
  prescription_date DATE NOT NULL,
  action_type VARCHAR(50) NOT NULL,
  action_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  vUser VARCHAR(50)
);

DROP TRIGGER IF EXISTS prescription_after_insert;
DROP TRIGGER IF EXISTS prescription_after_delete;
DROP TRIGGER IF EXISTS prescription_after_update;

DELIMITER //

CREATE TRIGGER prescription_after_insert
  AFTER INSERT ON prescription
  FOR EACH ROW
BEGIN
	DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO prescription_change VALUES
    (NEW.prescriptionID, NEW.prescription_name, NEW.brand, NEW.prescription_date, 
    'INSERTED', NOW(), vUser);
END//

CREATE TRIGGER prescription_after_delete
  AFTER DELETE ON prescription
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO prescription_change VALUES
    (OLD.prescriptionID, OLD.prescription_name, OLD.brand, OLD.prescription_date,
    'DELETED', NOW(), vUser);
END//

CREATE TRIGGER prescription_after_update
  AFTER UPDATE ON prescription
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO prescription_change VALUES
    (OLD.prescriptionID, OLD.prescription_name, OLD.brand, OLD.prescription_date,
    'UPDATED', NOW(), vUser);
END//


ALTER TABLE prescription AUTO_INCREMENT = 1;
INSERT INTO prescription(prescription_name, brand, prescription_date)
		VALUES ('Peroxide', 'TAH', '2020-10-30 13:15:00');


UPDATE prescription
SET  prescription_name = 'Jydrogen peroxide'
WHERE prescriptionID = 7;

DELETE FROM prescription WHERE prescriptionID = 7;

SELECT * 
FROM prescription_change;


/*Trigger gives information of updated, inserted, and deleted procedures*/
DROP TABLE IF EXISTS procedure_change;

CREATE TABLE procedure_change
(procedureID INT,
  procedure_name VARCHAR(50) NOT NULL,
  cost DECIMAL(10,2) NULL DEFAULT NULL,
  dentistID INT NOT NULL,
  dentist_assistantID INT NOT NULL,
  action_type VARCHAR(50) NOT NULL,
  action_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  vUser VARCHAR(50)
);

DROP TRIGGER IF EXISTS procedure_after_insert;
DROP TRIGGER IF EXISTS procedure_after_delete;
DROP TRIGGER IF EXISTS procedure_after_update;

DELIMITER //

CREATE TRIGGER procedure_after_insert
  AFTER INSERT ON procedures
  FOR EACH ROW
BEGIN
	DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO procedure_change VALUES
    (NEW.procedureID, NEW.procedure_name, NEW.cost, NEW.dentistID, NEW.dentist_assistantID, 
    'INSERTED', NOW(), vUser);
END//

CREATE TRIGGER procedure_after_delete
  AFTER DELETE ON procedures
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO procedure_change VALUES
    (OLD.procedureID, OLD.procedure_name, OLD.cost, OLD.dentistID, OLD.dentist_assistantID,
    'DELETED', NOW(), vUser);
END//

CREATE TRIGGER procedure_after_update
  AFTER UPDATE ON procedures
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO procedure_change VALUES
    (OLD.procedureID, OLD.procedure_name, OLD.cost, OLD.dentistID, OLD.dentist_assistantID,
    'UPDATED', NOW(), vUser);
END//


ALTER TABLE procedures AUTO_INCREMENT = 1;
INSERT INTO procedures(procedure_name, cost, dentistID, dentist_assistantID)
		VALUES ('Braces', 1234.45, 1, 5);


UPDATE procedures
SET  procedure_name = 'Veneers'
WHERE procedureID = 17;

DELETE FROM procedures WHERE procedureID = 17;

SELECT * 
FROM procedure_change;

/*Trigger gives information of updated, inserted, and deleted appointments*/
DROP TABLE IF EXISTS appointment_date_change;

CREATE TABLE appointment_date_change
(
  appointmentID INT NOT NULL,
  ap_date DATETIME, 
  action_type VARCHAR(50) NOT NULL,
  action_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  vUser VARCHAR(50)
);

DROP TRIGGER IF EXISTS ap_date_after_insert;
DROP TRIGGER IF EXISTS ap_date_after_delete;
DROP TRIGGER IF EXISTS ap_date_after_update;

DELIMITER //

CREATE TRIGGER ap_date_after_insert
  AFTER INSERT ON appointment
  FOR EACH ROW
BEGIN
	DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO appointment_date_change VALUES
    (NEW.appointmentID, NEW.ap_date, 
    'INSERTED', NOW(), vUser);
END//

CREATE TRIGGER ap_date_after_delete
  AFTER DELETE ON appointment
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO appointment_date_change VALUES
    (OLD.appointmentID, OLD.ap_date, 
    'DELETED', NOW(), vUser);
END//

CREATE TRIGGER ap_date_after_update
  AFTER UPDATE ON appointment
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO appointment_date_change VALUES
    (OLD.appointmentID, OLD.ap_date, 
    'UPDATED', NOW(), vUser);
END//

INSERT INTO appointment VALUES (137, '2020-11-15', 3, 3);

UPDATE appointment
SET ap_date = '2020-11-28 15:00:00'
WHERE appointmentID = 137;

DELETE FROM appointment WHERE appointmentID = 137;

SELECT * 
FROM appointment_date_change;


/*Trigger gives information of updated, inserted, and deleted diagnosis*/
DROP TABLE IF EXISTS diagnosis_change;

CREATE TABLE diagnosis_change
(diagnosisID INT,
  diagnosis VARCHAR(50),
  action_type VARCHAR(50) NOT NULL,
  action_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  vUser VARCHAR(50)
);

DROP TRIGGER IF EXISTS diagnosis_after_insert;
DROP TRIGGER IF EXISTS diagnosis_after_delete;
DROP TRIGGER IF EXISTS diagnosis_after_update;

DELIMITER //

CREATE TRIGGER diagnosis_after_insert
  AFTER INSERT ON diagnosis
  FOR EACH ROW
BEGIN
	DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO diagnosis_change VALUES
    (NEW.diagnosisID, NEW.diagnosis, 
    'INSERTED', NOW(), vUser);
END//

CREATE TRIGGER diagnosis_after_delete
  AFTER DELETE ON diagnosis
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO diagnosis_change VALUES
    (OLD.diagnosisID, OLD.diagnosis, 
    'DELETED', NOW(), vUser);
END//

CREATE TRIGGER diagnosis_after_update
  AFTER UPDATE ON diagnosis
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO diagnosis_change VALUES
    (OLD.diagnosisID, OLD.diagnosis, 
    'UPDATED', NOW(), vUser);
END//

INSERT INTO diagnosis VALUES (DEFAULT, 'paint');


UPDATE diagnosis
SET diagnosis = 'Root cavities'
WHERE diagnosisID = 7;

DELETE FROM diagnosis WHERE diagnosisID = 7;

SELECT * 
FROM diagnosis_change;


/*Trigger gives information of updated, inserted, and deleted symptoms*/
DROP TABLE IF EXISTS symptoms_change;

CREATE TABLE symptoms_change
(symptomsID INT,
  symptoms VARCHAR(50),
  action_type VARCHAR(50) NOT NULL,
  action_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  vUser VARCHAR(50)
);

DROP TRIGGER IF EXISTS symptoms_after_insert;
DROP TRIGGER IF EXISTS symptoms_after_delete;
DROP TRIGGER IF EXISTS symptoms_after_update;

DELIMITER //

CREATE TRIGGER symptoms_after_insert
  AFTER INSERT ON symptoms
  FOR EACH ROW
BEGIN
	DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO symptoms_change VALUES
    (NEW.symptomsID, NEW.symptoms, 
    'INSERTED', NOW(), vUser);
END//

CREATE TRIGGER symptoms_after_delete
  AFTER DELETE ON symptoms
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO symptoms_change VALUES
    (OLD.symptomsID, OLD.symptoms, 
    'DELETED', NOW(), vUser);
END//

CREATE TRIGGER symptoms_after_update
  AFTER UPDATE ON symptoms
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO symptoms_change VALUES
    (OLD.symptomsID, OLD.symptoms, 
    'UPDATED', NOW(), vUser);
END//

INSERT INTO symptoms VALUES (DEFAULT, 'pain');


UPDATE symptoms
SET symptoms = 'Cavities'
WHERE symptomsID = 15;

DELETE FROM symptoms WHERE symptomsID = 15;

SELECT * 
FROM symptoms_change;

/*Trigger gives information of updated, inserted, and deleted information from billing table*/
DROP TABLE IF EXISTS billing_change;

CREATE TABLE billing_change
(billingID INT,
  amount DECIMAL(10,2) NULL,
  balance DECIMAL(10,2) NULL,
  billing_date DATETIME NULL,
  action_type VARCHAR(50) NOT NULL,
  action_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  vUser VARCHAR(50)
);

DROP TRIGGER IF EXISTS billing_after_insert;
DROP TRIGGER IF EXISTS billing_after_delete;
DROP TRIGGER IF EXISTS billing_after_update;

DELIMITER //

CREATE TRIGGER billing_after_insert
  AFTER INSERT ON billing
  FOR EACH ROW
BEGIN
	DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO billing_change VALUES
    (NEW.billingID, NEW.amount, NEW.balance, NEW.billing_date,
    'INSERTED', NOW(), vUser);
END//

CREATE TRIGGER billing_after_delete
  AFTER DELETE ON billing
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO billing_change VALUES
    (OLD.billingID, OLD.amount, OLD.balance, OLD.billing_date,
    'DELETED', NOW(), vUser);
END//

CREATE TRIGGER billing_after_update
  AFTER UPDATE ON billing
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO billing_change VALUES
    (OLD.billingID, OLD.amount, OLD.balance, OLD.billing_date, 
    'UPDATED', NOW(), vUser);
END//

ALTER TABLE billing AUTO_INCREMENT = 1;
INSERT INTO billing (amount, balance, billing_date) VALUES (678.9, 1234.3, '2020-11-25 08:09:00');

SELECT * 
FROM billing_change;


/*Trigger gives information of updated, inserted, and deleted information from account_balance table*/
DROP TABLE IF EXISTS account_balance_change;

CREATE TABLE account_balance_change
(
  accountID INT,
  amount DECIMAL(10,2),
  account_balance_date DATETIME,
  action_type VARCHAR(50) NOT NULL,
  action_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  vUser VARCHAR(50)
);

DROP TRIGGER IF EXISTS account_balance_after_insert;
DROP TRIGGER IF EXISTS account_balance_after_delete;
DROP TRIGGER IF EXISTS account_balance_after_update;


DELIMITER //

CREATE TRIGGER account_balance_after_insert
  AFTER INSERT ON account_balance
  FOR EACH ROW
BEGIN
	DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO account_balance_change VALUES
    (NEW.accountID, NEW.amount, NEW.account_balance_date,
    'INSERTED', NOW(), vUser);
END//

CREATE TRIGGER account_balance_after_delete
  AFTER DELETE ON account_balance
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO account_balance_change VALUES
    (OLD.accountID, OLD.amount, OLD.account_balance_date,
    'DELETED', NOW(), vUser);
END//

CREATE TRIGGER account_balance_after_update
  AFTER UPDATE ON account_balance
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO account_balance_change VALUES
    (OLD.accountID, OLD.amount, OLD.account_balance_date,
    'UPDATED', NOW(), vUser);
END//

ALTER TABLE account_balance AUTO_INCREMENT=1;
INSERT INTO account_balance(amount, account_balance_date, billingID) 
	VALUES (576.89, '2020-10-30 16:43:25', 1)

SELECT * 
FROM account_balance_change;

/*Trigger gives information of updated, inserted, and deleted adress*/
DROP TABLE IF EXISTS adress_change;

CREATE TABLE adress_change
(adressID INT,
  streat VARCHAR(50) NOT NULL,
  building VARCHAR(50) NULL DEFAULT NULL,
  apartment VARCHAR(50) NULL DEFAULT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  zip_code CHAR(5) NULL DEFAULT NULL,
  action_type VARCHAR(50) NOT NULL,
  action_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  vUser VARCHAR(50)
);

DROP TRIGGER IF EXISTS adress_after_insert;
DROP TRIGGER IF EXISTS adress_after_delete;
DROP TRIGGER IF EXISTS adress_after_update;

DELIMITER //

CREATE TRIGGER adress_after_insert
  AFTER INSERT ON adress
  FOR EACH ROW
BEGIN
	DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO adress_change VALUES
    (NEW.adressID, NEW.streat, NEW.building, NEW.apartment, NEW.city, NEW.state, NEW.zip_code, 
    'INSERTED', NOW(), vUser);
END//

CREATE TRIGGER adress_after_delete
  AFTER DELETE ON adress
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO adress_change VALUES
    (OLD.adressID, OLD.streat, OLD.building, OLD.apartment, OLD.city, OLD.state, OLD.zip_code,
    'DELETED', NOW(), vUser);
END//

CREATE TRIGGER adress_after_update
  AFTER UPDATE ON adress
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO adress_change VALUES
    (OLD.adressID, OLD.streat, OLD.building, OLD.apartment, OLD.city, OLD.state, OLD.zip_code, 
    'UPDATED', NOW(), vUser);
END//

INSERT INTO adress VALUES (204, 'Grand Alley', '123A', '', 'Gastonia', 'SC', 27209);

UPDATE adress
SET zip_code = 27207
WHERE adressID = 204;

DELETE FROM adress WHERE adressID = 204;

SELECT * 
FROM adress_change;


/*Trigger gives information of updated, inserted, and deleted dentist*/
DROP TABLE IF EXISTS procedure_change;

CREATE TABLE dentist_change
(dentistID INT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  dentist_position VARCHAR(50) NOT NULL,
  action_type VARCHAR(50) NOT NULL,
  action_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  vUser VARCHAR(50)
);

DROP TRIGGER IF EXISTS dentist_after_insert;
DROP TRIGGER IF EXISTS dentist_after_delete;
DROP TRIGGER IF EXISTS dentist_after_update;

DELIMITER //

CREATE TRIGGER dentist_after_insert
  AFTER INSERT ON dentist
  FOR EACH ROW
BEGIN
	DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO dentist_change VALUES
    (NEW.dentistID, NEW.first_name, NEW.last_name, NEW.dentist_position, 
    'INSERTED', NOW(), vUser);
END//

CREATE TRIGGER dentist_after_delete
  AFTER DELETE ON dentist
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO dentist_change VALUES
    (OLD.dentistID, OLD.first_name, OLD.last_name, OLD.dentist_position,
    'DELETED', NOW(), vUser);
END//

CREATE TRIGGER dentist_after_update
  AFTER UPDATE ON dentist
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO dentist_change VALUES
    (OLD.dentistID, OLD.first_name, OLD.last_name, OLD.dentist_position,
    'UPDATED', NOW(), vUser);
END//


ALTER TABLE dentist AUTO_INCREMENT = 1;
INSERT INTO dentist(first_name, last_name, dentist_position)
		VALUES ('Alison', 'Cortney', 'Orthodontist');


UPDATE dentist
SET  last_name = 'Wiltcher'
WHERE dentistID = 10;

DELETE FROM dentist WHERE dentistID = 10;

SELECT * 
FROM dentist_change;

/*Trigger gives information of updated, inserted, and deleted dentist assistant*/
DROP TABLE IF EXISTS dentist_assistant_change;

CREATE TABLE dentist_assistant_change
(dentist_assistantID INT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  action_type VARCHAR(50) NOT NULL,
  action_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  vUser VARCHAR(50)
);

DROP TRIGGER IF EXISTS dentist_assistant_after_insert;
DROP TRIGGER IF EXISTS dentist_assistant_after_delete;
DROP TRIGGER IF EXISTS dentist_assistant_after_update;

DELIMITER //

CREATE TRIGGER dentist_assistant_after_insert
  AFTER INSERT ON dentist_assistant
  FOR EACH ROW
BEGIN
	DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO dentist_assistant_change VALUES
    (NEW.dentist_assistantID, NEW.first_name, NEW.last_name, 
    'INSERTED', NOW(), vUser);
END//

CREATE TRIGGER dentist_assistant_after_delete
  AFTER DELETE ON dentist_assistant
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO dentist_assistant_change VALUES
    (OLD.dentist_assistantID, OLD.first_name, OLD.last_name,
    'DELETED', NOW(), vUser);
END//

CREATE TRIGGER dentist_assistant_after_update
  AFTER UPDATE ON dentist_assistant
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO dentist_assistant_change VALUES
    (OLD.dentist_assistantID, OLD.first_name, OLD.last_name,
    'UPDATED', NOW(), vUser);
END//


ALTER TABLE dentist_assistant AUTO_INCREMENT = 1;
INSERT INTO dentist_assistant(first_name, last_name)
		VALUES ('Alison', 'Cortney');


UPDATE dentist_assistant
SET  last_name = 'Wiltcher'
WHERE dentist_assistantID = 7;

DELETE FROM dentist_assistant WHERE dentist_assistantID = 7;

SELECT * 
FROM dentist_assistant_change;

/*Trigger gives information of updated, inserted, and deleted insurance*/
DROP TABLE IF EXISTS insurance_change;

CREATE TABLE insurance_change
(insuranceID INT,
  provider VARCHAR(50) NOT NULL,
  group_number VARCHAR(50) NULL DEFAULT NULL,
  subscriber_number VARCHAR(50) NULL DEFAULT NULL,
  insurance_paymentID INT NOT NULL,
  action_type VARCHAR(50) NOT NULL,
  action_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  vUser VARCHAR(50)
);

DROP TRIGGER IF EXISTS insurance_after_insert;
DROP TRIGGER IF EXISTS insurance_after_delete;
DROP TRIGGER IF EXISTS insurance_after_update;

DELIMITER //

CREATE TRIGGER insurance_after_insert
  AFTER INSERT ON insurance
  FOR EACH ROW
BEGIN
	DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO insurance_change VALUES
    (NEW.insuranceID, NEW.provider, NEW.group_number, NEW.subscriber_number, NEW.insurance_paymentID, 
    'INSERTED', NOW(), vUser);
END//

CREATE TRIGGER insurance_after_delete
  AFTER DELETE ON insurance
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO insurance_change VALUES
    (OLD.insuranceID, OLD.provider, OLD.group_number, OLD.subscriber_number, OLD.insurance_paymentID,
    'DELETED', NOW(), vUser);
END//

CREATE TRIGGER insurance_after_update
  AFTER UPDATE ON insurance
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO insurance_change VALUES
    (OLD.insuranceID, OLD.provider, OLD.group_number, OLD.subscriber_number, OLD.insurance_paymentID,
    'UPDATED', NOW(), vUser);
END//


ALTER TABLE insurance AUTO_INCREMENT = 1;
INSERT INTO insurance(provider, group_number, subscriber_number, insurance_paymentID)
		VALUES ('BlueCrossBlueShield', '02A', '24Q', 26);


UPDATE insurance
SET  provider = 'BCBS'
WHERE insuranceID = 124;

DELETE FROM insurance WHERE insuranceID = 124;

SELECT * 
FROM insurance_change;

/*Trigger gives information of updated, inserted, and deleted insurance payment*/
DROP TABLE IF EXISTS insurance_payment_change;

CREATE TABLE insurance_payment_change
(insurance_paymentID INT,
amount DECIMAL(10,2) NULL DEFAULT NULL,
  payment_date DATETIME NULL DEFAULT NULL,
  action_type VARCHAR(50) NOT NULL,
  action_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  vUser VARCHAR(50)
);

DROP TRIGGER IF EXISTS insurance_payment_after_insert;
DROP TRIGGER IF EXISTS insurance_payment_after_delete;
DROP TRIGGER IF EXISTS insurance_payment_after_update;

DELIMITER //

CREATE TRIGGER insurance_payment_after_insert
  AFTER INSERT ON insurance_payment
  FOR EACH ROW
BEGIN
	DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO insurance_payment_change VALUES
    (NEW.insurance_paymentID, NEW.amount, NEW.payment_date, 
    'INSERTED', NOW(), vUser);
END//

CREATE TRIGGER insurance_payment_after_delete
  AFTER DELETE ON insurance_payment
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO insurance_payment_change VALUES
    (OLD.insurance_paymentID, OLD.amount, OLD.payment_date,
    'DELETED', NOW(), vUser);
END//

CREATE TRIGGER insurance_payment_after_update
  AFTER UPDATE ON insurance_payment
  FOR EACH ROW
BEGIN
    DECLARE vUser VARCHAR(50);
    SELECT USER() into vUser;
    INSERT INTO insurance_payment_change VALUES
    (OLD.insurance_paymentID, OLD.amount, OLD.payment_date,
    'UPDATED', NOW(), vUser);
END//


ALTER TABLE insurance_payment AUTO_INCREMENT = 1;
INSERT INTO insurance_payment(amount, payment_date)
		VALUES (567.98, '2020-11-30 11:59:59');


UPDATE insurance_payment
SET  amount = 768.89
WHERE insurance_paymentID = 454;

DELETE FROM insurance_payment WHERE insurance_paymentID = 454;

SELECT * 
FROM insurance_payment_change;

/*Trigger allows to update balance*/
DROP TABLE IF EXISTS TriggerUpdateAccountBalanceTable;

CREATE TABLE TriggerUpdateAccountBalanceTable
(
  accountID INT,
  accountNumber INT,
  before_balance decimal(10,2) NOT NULL,
  after_balance decimal(10,2) NOT NULL,
  action_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
SELECT *
FROM TriggerUpdateAccountBalanceTable;

DROP TRIGGER IF EXISTS updateRecordTrigger;

DELIMITER //
CREATE TRIGGER updateRecordTrigger
  AFTER UPDATE ON account_balance
  FOR EACH ROW
BEGIN
    IF OLD.amount <> NEW.amount THEN
        INSERT INTO TriggerUpdateAccountBalanceTable(accountNumber,before_balance, after_balance)
        VALUES(OLD.accountID, OLD.amount, NEW.amount);
    END IF;
END//

UPDATE account_balance
SET amount = 2345.67
WHERE accountID = 7;

SELECT * 
FROM TriggerUpdateAccountBalanceTable;

SHOW TRIGGERS;
