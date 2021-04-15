/*Procedure adds a new row(new adress) to the adress table*/
DROP PROCEDURE IF EXISTS insert_adress;

DELIMITER //

CREATE PROCEDURE insert_adress
(
  adressID_param INT,   
  streat_param   VARCHAR(50),
  building_param   VARCHAR(50),
  apartment_param   VARCHAR(50),
  city_param   VARCHAR(50),
  state_param   VARCHAR(50),
  zip_code_param   CHAR(5)
)
BEGIN
  INSERT INTO adress
  VALUES (adressID_param, streat_param, building_param, apartment_param,
			city_param, state_param, zip_code_param);
END//

CALL insert_adress(135, 'Old Streat', '23', '', 'Anchorage', 'AL', 90678);

/*Clean up*/
DELETE FROM adress WHERE adressID = 135;

SELECT*
FROM adress;

/*Procedure adds a new row(new dentist) to the dentist table*/
DROP PROCEDURE IF EXISTS insert_dentist;

DELIMITER //

CREATE PROCEDURE insert_dentist
(
  dentistID_param        INT,   
  first_name_param   VARCHAR(50),
  last_name_param   VARCHAR(50),
  dentist_position_param   VARCHAR(50)
)
BEGIN
  INSERT INTO dentist
  VALUES (dentistID_param, first_name_param, last_name_param, dentist_position_param);
END//

CALL insert_dentist(9, 'Mike', 'Salvery', 'General Dentist');

/*Clean up*/
DELETE FROM dentist WHERE dentistID = 9;

SELECT*
FROM dentist;

/*Procedure adds a new row(new dentist assistant) to the dentist_assistant table*/
DROP PROCEDURE IF EXISTS insert_dentist_assistant;

DELIMITER //

CREATE PROCEDURE insert_dentist_assistant
(
  dentist_assistantID_param INT,   
  first_name_param   VARCHAR(50),
  last_name_param   VARCHAR(50)
)
BEGIN
  INSERT INTO dentist_assistant
  VALUES (dentist_assistantID_param, first_name_param, last_name_param);
END//

CALL insert_dentist_assistant(6, 'Crista', 'Wisely');

SELECT*
FROM dentist_assistant;


/*Procedure adds a new row(new diagnosis) to the diagnosis table*/
DROP PROCEDURE IF EXISTS insert_diagnosis;

DELIMITER //

CREATE PROCEDURE insert_diagnosis
(
  diagnosisID_param        INT,   
  diagnosis_param   VARCHAR(50)
)
BEGIN
  INSERT INTO diagnosis
  VALUES (diagnosisID_param, diagnosis_param);
END//

CALL insert_diagnosis(4, 'Cavities');

/*Clean up*/
DELETE FROM diagnosis WHERE diagnosisID = 4;

SELECT*
FROM diagnosis;

/*Procedure adds a new row(new prescription) to the prescription table*/
DROP PROCEDURE IF EXISTS insert_prescription;

DELIMITER //

CREATE PROCEDURE insert_prescription
(
  prescriptionID_param INT,
  prescription_name_param VARCHAR(50),
  brand_param VARCHAR(50),
  prescription_date_param DATETIME 
)
BEGIN
  INSERT INTO prescription
  VALUES (prescriptionID_param, prescription_name_param, brand_param, prescription_date_param);
END//

CALL insert_prescription(6, 'Zirtek', 'WOSS', '2020-11-12 18:00:00');

SELECT *
FROM prescription WHERE prescriptionID=6;

/*Procedure adds a new row(new symptom) to the symptoms table*/
DROP PROCEDURE IF EXISTS insert_symptoms;

DELIMITER //

CREATE PROCEDURE insert_symptoms
(
	symptomsID_param INT,
	symptoms_param VARCHAR(50)
)
BEGIN
  INSERT INTO symptoms
  VALUES (symptomsID_param, symptoms_param);
END//

CALL insert_symptoms(10, 'Taste loss');

SELECT *
FROM symptoms WHERE symptomsID=10;
