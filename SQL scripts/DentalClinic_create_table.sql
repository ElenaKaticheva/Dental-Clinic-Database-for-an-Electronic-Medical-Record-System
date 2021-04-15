DROP SCHEMA IF EXISTS DentalClinic;
CREATE SCHEMA IF NOT EXISTS DentalClinic;
USE DentalClinic;

/*Billing Table*/
DROP TABLE IF EXISTS DentalClinic.billing;
CREATE TABLE IF NOT EXISTS DentalClinic.billing (
  billingID INT NOT NULL AUTO_INCREMENT,
  amount DECIMAL(10,2) NULL DEFAULT NULL,
  balance DECIMAL(10,2) NULL DEFAULT NULL,
  billing_date DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (billingID))
ENGINE = InnoDB;

/*Account Balance Table*/
DROP TABLE IF EXISTS DentalClinic.account_balance;
CREATE TABLE IF NOT EXISTS DentalClinic.account_balance (
  accountID INT NOT NULL AUTO_INCREMENT,
  amount DECIMAL(10,2) NULL DEFAULT NULL,
  account_balance_date DATETIME NULL DEFAULT NULL,
  billingID INT NOT NULL,
  PRIMARY KEY (accountID, billingID),
  CONSTRAINT account_balance_fk_billing
    FOREIGN KEY (billingID)
    REFERENCES DentalClinic.billing (billingID)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

/*Adress Table*/
DROP TABLE IF EXISTS DentalClinic.adress;
CREATE TABLE IF NOT EXISTS DentalClinic.adress (
  adressID INT NOT NULL AUTO_INCREMENT,
  streat VARCHAR(50) NOT NULL,
  building VARCHAR(50) NULL DEFAULT NULL,
  apartment VARCHAR(50) NULL DEFAULT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  zip_code CHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (adressID))
ENGINE = InnoDB;

/*Dentist Table*/
DROP TABLE IF EXISTS DentalClinic.dentist;
CREATE TABLE IF NOT EXISTS DentalClinic.dentist (
  dentistID INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  dentist_position VARCHAR(50) NOT NULL,
  PRIMARY KEY (dentistID))
ENGINE = InnoDB;

/*Dentist Assistant Table*/
DROP TABLE IF EXISTS DentalClinic.dentist_assistant;
CREATE TABLE IF NOT EXISTS DentalClinic.dentist_assistant (
  dentist_assistantID INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (dentist_assistantID))
ENGINE = InnoDB;

/*Procedures Table*/
DROP TABLE IF EXISTS DentalClinic.procedures;
CREATE TABLE IF NOT EXISTS DentalClinic.procedures (
  procedureID INT NOT NULL AUTO_INCREMENT,
  procedure_name VARCHAR(50) NOT NULL,
  cost DECIMAL(10,2) NULL DEFAULT NULL,
  dentistID INT NOT NULL,
  dentist_assistantID INT NOT NULL,
  PRIMARY KEY (procedureID),
  CONSTRAINT procedures_fk_dentist
    FOREIGN KEY (dentistID)
    REFERENCES DentalClinic.dentist (dentistID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT procedures_fk_dentist_assistant
    FOREIGN KEY (dentist_assistantID)
    REFERENCES DentalClinic.dentist_assistant (dentist_assistantID)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

/*Diagnosis Table*/
DROP TABLE IF EXISTS DentalClinic.diagnosis;
CREATE TABLE IF NOT EXISTS DentalClinic.diagnosis (
  diagnosisID INT NOT NULL AUTO_INCREMENT,
  diagnosis VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (diagnosisID))
ENGINE = InnoDB;

/*Insurance Payment Table*/
DROP TABLE IF EXISTS DentalClinic.insurance_payment;
CREATE TABLE IF NOT EXISTS DentalClinic.insurance_payment (
  insurance_paymentID INT NOT NULL AUTO_INCREMENT,
  amount DECIMAL(10,2) NULL DEFAULT NULL,
  payment_date DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (insurance_paymentID))
ENGINE = InnoDB;

/*Insurance Table*/
DROP TABLE IF EXISTS DentalClinic.insurance;
CREATE TABLE IF NOT EXISTS DentalClinic.insurance (
  insuranceID INT NOT NULL AUTO_INCREMENT,
  provider VARCHAR(50) NULL DEFAULT NULL,
  group_number VARCHAR(50) NULL DEFAULT NULL,
  subscriber_number VARCHAR(50) NULL DEFAULT NULL,
  insurance_paymentID INT NOT NULL,
  PRIMARY KEY (insuranceID),
  CONSTRAINT insurance_fk_insurance_payment
    FOREIGN KEY (insurance_paymentID)
    REFERENCES DentalClinic.insurance_payment (insurance_paymentID)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

/*Symptoms Table*/
DROP TABLE IF EXISTS DentalClinic.symptoms;
CREATE TABLE IF NOT EXISTS DentalClinic.symptoms (
  symptomsID INT NOT NULL AUTO_INCREMENT,
  symptoms VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (symptomsID))
ENGINE = InnoDB;

/*Prescription Table*/
DROP TABLE IF EXISTS DentalClinic.prescription;
CREATE TABLE IF NOT EXISTS DentalClinic.prescription (
  prescriptionID INT NOT NULL AUTO_INCREMENT,
  prescription_name VARCHAR(50) NULL DEFAULT NULL,
  brand VARCHAR(50) NULL DEFAULT NULL,
  prescription_date DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (prescriptionID))
ENGINE = InnoDB;

/*Medical Record Table*/
DROP TABLE IF EXISTS DentalClinic.medical_record;
CREATE TABLE IF NOT EXISTS DentalClinic.medical_record (
  medical_recordID INT NOT NULL AUTO_INCREMENT,
  symptomsID INT NOT NULL,
  diagnosisID INT NOT NULL,
  prescriptionID INT NOT NULL,
  PRIMARY KEY (medical_recordID),
  CONSTRAINT medical_record_fk_symptoms
    FOREIGN KEY (symptomsID)
    REFERENCES DentalClinic.symptoms (symptomsID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT medical_record_fk_diagnosis
    FOREIGN KEY (diagnosisID)
    REFERENCES DentalClinic.diagnosis (diagnosisID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT medical_record_fk_prescription
    FOREIGN KEY (prescriptionID)
    REFERENCES DentalClinic.prescription (prescriptionID)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;



/*Patient Table*/
DROP TABLE IF EXISTS DentalClinic.patient;
CREATE TABLE IF NOT EXISTS DentalClinic.patient (
  patientID INT NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (patientID),
  CONSTRAINT patient_fk_insurance
    FOREIGN KEY (insuranceID)
    REFERENCES DentalClinic.insurance (insuranceID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT patient_fk_medical_record
    FOREIGN KEY (medical_recordID)
    REFERENCES DentalClinic.medical_record (medical_recordID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT patient_fk_account_balance
    FOREIGN KEY (accountID)
    REFERENCES DentalClinic.account_balance (accountID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT patient_fk_adress
    FOREIGN KEY (adressID)
    REFERENCES DentalClinic.adress (adressID)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

/*Appointment Table*/
DROP TABLE IF EXISTS DentalClinic.appointment;
CREATE TABLE IF NOT EXISTS DentalClinic.appointment (
  appointmentID INT NOT NULL AUTO_INCREMENT,
  ap_date DATETIME NOT NULL,
  procedureID INT NOT NULL,
  patientID INT NOT NULL,
  PRIMARY KEY (appointmentID),
  CONSTRAINT appointment_fk_patient
    FOREIGN KEY (procedureID)
    REFERENCES DentalClinic.procedures (procedureID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT appointment_FK_patien
    FOREIGN KEY (patientID)
    REFERENCES DentalClinic.patient (patientID)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

/*Many to many relationship table (Insurance payment and biling)*/
DROP TABLE IF EXISTS `DentalClinic`.`insurance_payment_billing`;
CREATE TABLE IF NOT EXISTS `DentalClinic`.`insurance_payment_billing` (
  `insurance_paymentID` INT NOT NULL,
  `billingID` INT NOT NULL,
  PRIMARY KEY (`insurance_paymentID`, `billingID`),
  CONSTRAINT `insurance_payment_billing_fk`
    FOREIGN KEY (`insurance_paymentID`)
    REFERENCES `DentalClinic`.`insurance_payment` (`insurance_paymentID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `insurance_payment_billing_f`
    FOREIGN KEY (`billingID`)
    REFERENCES `DentalClinic`.`billing` (`billingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

