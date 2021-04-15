/*Stored function returns account_balance level on amount*/
USE DentalClinic;

DROP FUNCTION IF EXISTS AccountBalance;

DELIMITER //
CREATE FUNCTION AccountBalance(
	amount_balance DECIMAL(10,2)
)
RETURNS VARCHAR(50)
DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE patientBalance VARCHAR(50);
    SELECT accountID
    INTO patientBalance
    FROM account_balance
    WHERE amount = amount_balance;
    IF amount_balance < 500 THEN
		SET patientBalance = 'LOW';
    ELSEIF (amount_balance >= 500 AND amount_balance <1000) THEN
		SET patientBalance = 'MEDIUM';
	ELSEIF amount_balance >=1000 THEN
		SET patientBalance = 'HIGH';
	END IF;
    RETURN(patientBalance);
END//
    
SHOW FUNCTION STATUS 
WHERE db = 'DentalClinic';

SELECT accountID, AccountBalance(amount)
FROM
    account_balance;


/*Stored function calculates balance_amount*/
DROP FUNCTION IF EXISTS balanceAmount;

DELIMITER //
CREATE FUNCTION balanceAmount
(
	billingID_param INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE balance_amount DECIMAL(10,2);
    SELECT balance + amount
    INTO balance_amount
    FROM billing
    WHERE billingID = billingID_param;
    
    RETURN balance_amount;
END//
    
SELECT billingID, balanceAmount(billingID) AS balance_amount
FROM billing;


/*Stored Function checks if ssn already exists in patient table*/
DROP FUNCTION IF EXISTS test_patient_ssn;

DELIMITER //

CREATE FUNCTION test_patient_ssn
(
   ssn_param CHAR(9)
)
RETURNS INT
DETERMINISTIC READS SQL DATA
BEGIN
  DECLARE ssn_duplicate TINYINT DEFAULT FALSE;
  DECLARE ssn_not_found TINYINT DEFAULT FALSE;  
  DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET ssn_not_found = TRUE;
  SELECT TRUE
  INTO ssn_duplicate
  FROM patient
  WHERE ssn = ssn_param;
  
  RETURN ssn_duplicate;
  
  IF ssn_not_found = FALSE THEN
    IF ssn_duplicate = TRUE THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END IF;
END//

SELECT test_patient_ssn('123567889') AS ssn_exist;
SELECT test_patient_ssn('123575889') AS ssn_non_exist;

SELECT ssn
FROM patient;



