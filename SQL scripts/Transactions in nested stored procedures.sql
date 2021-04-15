/*Procedure updates amount, account balance date for the account_balance table*/
DROP PROCEDURE IF EXISTS update_account_balance;

DELIMITER //

CREATE PROCEDURE update_account_balance
(
  accountID_param      INT,
  amount_param    DECIMAL(10,2),
  account_balance_date_param DATETIME,
  billingID_param INT
)
BEGIN
  DECLARE sql_error INT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;

  START TRANSACTION;  

  UPDATE account_balance
  SET amount = amount_param
  WHERE accountID = accountID_param;
  
  UPDATE account_balance
  SET account_balance_date = account_balance_date_param
  WHERE accountID = accountID_param;

  IF sql_error = FALSE THEN
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END//  

DELIMITER ;

CALL update_account_balance(7, 1456, '2020-11-25 17:05:09', 7);

SELECT accountID, amount, account_balance_date 
FROM account_balance WHERE accountID = 7;

/*Procedure updates an appointment date for the appointment table*/
DROP PROCEDURE IF EXISTS update_appointment_date;

DELIMITER //

CREATE PROCEDURE update_appointment_date
(
  appointmentID_param INT,
  ap_date_param DATETIME,
  procedure_param INT,
  patientID_param INT
)
BEGIN
  DECLARE sql_error INT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;

  START TRANSACTION;  

  UPDATE appointment
  SET ap_date = ap_date_param
  WHERE appointmentID = appointmentID_param;

  IF sql_error = FALSE THEN
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END//

DELIMITER ;

CALL update_appointment_date(23, '2020-11-25 08:00:00', 1, 4);

SELECT appointmentID, ap_date
FROM appointment WHERE appointmentID = 23;

/*Procedure updates amount, balance, balance date for the billing table*/
DROP PROCEDURE IF EXISTS update_billing;

DELIMITER //

CREATE PROCEDURE update_billing
(
  billingID_param      INT,
  amount_param    DECIMAL(10,2),
  balance_param DECIMAL(10,2),
  billing_date_param DATETIME
)
BEGIN
  DECLARE sql_error INT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;

  START TRANSACTION;  

  UPDATE billing
  SET amount = amount_param
  WHERE billingID = billingID_param;
  
  UPDATE billing
  SET balance = balance_param
  WHERE billingID = billingID_param;
  
  UPDATE billing
  SET billing_date = billing_date_param
  WHERE billingID = billingID_param;

  IF sql_error = FALSE THEN
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END//

DELIMITER ;

CALL update_billing(5, 578.9, 854.67, '2020-12-12 15:00:00');

SELECT billingID, amount, balance
FROM billing WHERE billingID = 5;

/*Procedure updates information for the insurance table*/
DROP PROCEDURE IF EXISTS update_insurance;

DELIMITER //

CREATE PROCEDURE update_insurance
(
  insuranceID_param        INT,   
  provider_param   VARCHAR(50),
  group_number_param VARCHAR(50),
  subscriber_number_param VARCHAR(50),
  insurance_paymentID_param INT
)
BEGIN
  DECLARE sql_error INT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;

  START TRANSACTION;  

  UPDATE insurance
  SET group_number = group_number_param
  WHERE insuranceID = insuranceID_param;
  
  UPDATE insurance
  SET subscriber_number = subscriber_number_param
  WHERE insuranceID = insuranceID_param;

  IF sql_error = FALSE THEN
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END//

DELIMITER ;

CALL update_insurance(90, 'AllState', '02A', '21', 126);

SELECT insuranceID, group_number, subscriber_number 
FROM insurance WHERE insuranceID = 90;

/*Procedure updates amount, payment date for the insurance payment table*/
DROP PROCEDURE IF EXISTS update_insurance_payment;

DELIMITER //

CREATE PROCEDURE update_insurance_payment
(
  insurance_paymentID_param      INT,
  amount_param    DECIMAL(10,2),
  payment_date_param DATETIME
)
BEGIN
  DECLARE sql_error INT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;

  START TRANSACTION;  

  UPDATE insurance_payment
  SET amount = amount_param
  WHERE insurance_paymentID = insurance_paymentID_param;
  
  UPDATE insurance_payment
  SET payment_date = payment_date_param
  WHERE insurance_paymentID = insurance_paymentID_param;

  IF sql_error = FALSE THEN
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END//

DELIMITER ;

CALL update_insurance_payment(453, 567.73, '2020-12-05 08:15:09');

SELECT *
FROM insurance_payment WHERE insurance_paymentID = 453;

/*Procedure updates patient information for the patient table*/
DROP PROCEDURE IF EXISTS update_patient;

DELIMITER //

CREATE PROCEDURE update_patient
(
  patientID_param INT,
  first_name_param VARCHAR(50),
  last_name_param VARCHAR(50),
  gender_param VARCHAR(10),
  date_of_birth_param DATE,
  email_param VARCHAR(50),
  phone_param VARCHAR(50),
  ssn_param CHAR(9),
  insuranceID_param INT,
  medical_recordID_param INT,
  accountID_param INT,
  adressID_param INT
)
BEGIN
  DECLARE sql_error INT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;

  START TRANSACTION;  

  UPDATE patient
  SET phone = phone_param
  WHERE patientID = patientID_param;

  IF sql_error = FALSE THEN
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END//

DELIMITER ;

CALL update_patient(1, 'Ashley', 'Nickolson', 'F', '1995-05-26', 'ashley.nickolson@gmail.com', '705-697-2828',
		123567889, 45, 3, 2, 231);
SELECT *
FROM patient WHERE patientID = 1;


/*Procedure updates cost for the procedure table*/
DROP PROCEDURE IF EXISTS update_procedure_cost;

DELIMITER //

CREATE PROCEDURE update_procedure_cost
(
  procedureID_param INT,
	procedure_name_param VARCHAR(50),
	cost_param DECIMAL(10,2),
	dentistID_param INT,
	dentist_assistantID_param INT
)
BEGIN
  DECLARE sql_error INT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;

  START TRANSACTION;  

  UPDATE procedures
  SET cost = cost_param
  WHERE procedureID = procedureID_param;

  IF sql_error = FALSE THEN
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END//

DELIMITER ;

CALL update_procedure_cost(16, 'Root Canals', 625.45, 5, 2);
SELECT *
FROM procedures WHERE procedureID = 16;
