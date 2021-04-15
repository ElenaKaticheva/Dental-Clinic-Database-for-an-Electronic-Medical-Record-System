/*Medical record information*/
CREATE OR REPLACE VIEW medical_record_info
AS
SELECT symptoms, diagnosis, prescription_name, brand, prescription_date
FROM medical_record JOIN symptoms
	ON medical_record.symptomsID = symptoms.symptomsID
	JOIN diagnosis
    ON medical_record.diagnosisID = diagnosis.diagnosisID
    JOIN prescription
    ON medical_record.prescriptionID = prescription.prescriptionID;

SELECT*
FROM medical_record_info;

/*Procedure infromation and dentist assigned to that procedure*/
CREATE OR REPLACE VIEW procedure_dentist_info
AS
SELECT p.procedure_name, p.cost, d.dentist_position, d.first_name, d.last_name
FROM procedures AS p JOIN dentist AS d
	ON p.dentistID = d.dentistID;

SELECT *
FROM procedure_dentist_info;

/*Appointment infromation including procedure name and patient name*/
CREATE OR REPLACE VIEW appointment_info
AS
SELECT a.ap_date, pr.procedure_name, p.first_name AS 'patient first name', p.last_name AS 'patient last name', p.phone AS 'patient phone'
FROM appointment AS a JOIN procedures AS pr
	ON a.procedureID = pr.procedureID
    JOIN patient AS p
    ON a.patientID = p.patientID;

SELECT *
FROM appointment_info;