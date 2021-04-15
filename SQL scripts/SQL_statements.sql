/*Change billing date*/
UPDATE billing
SET billing_date = '2020-11-05 14:34:25'
WHERE billingID = 1;

UPDATE billing
SET billing_date = '2020-09-11 08:15:05'
WHERE billingID = 2;

UPDATE billing
SET billing_date = '2020-08-06 11:00:00'
WHERE billingID = 5;

SELECT *
FROM billing;

/*Appointment*/
SELECT P.first_name AS 'Patient First Name', P.last_name AS 'Patient Last Name',
		A.ap_date AS 'Appointment Date',
        PR.procedure_name AS 'Procedure'
FROM patient P, appointment A, procedures PR
WHERE P.patientID = A.patientID AND A.procedureID = PR.procedureID;
    
/*Patient Medical History*/
SELECT P.first_name AS 'Patient First Name', P.last_name AS 'Patient Last Name',
		S.symptoms AS 'Symptoms', D.diagnosis AS 'Diagnosis', PR.prescription_name 'Prescription'
FROM medical_record M
	JOIN patient P ON M.medical_recordID = P.medical_recordID
	LEFT JOIN symptoms S ON M.symptomsID = S.symptomsID
    LEFT JOIN diagnosis D ON M.diagnosisID = D.diagnosisID
    LEFT JOIN prescription PR ON M.prescriptionID = PR.prescriptionID;

/*Patient Information*/ 
SELECT P.first_name, P.last_name, P.gender, P.date_of_birth, P.email, P.ssn,
		AD.streat, AD.building, AD.apartment, AD.city, AD.state, AD.zip_code,
        S.symptoms, D.diagnosis, PR.prescription_name,
        I.provider AS 'insurance provider' , I.group_number, I.subscriber_number,
        AB.amount, AB.account_balance_date
 FROM patient P
	JOIN adress AD ON P.adressID = AD.adressID
	JOIN medical_record M ON P.medical_recordID = M.medical_recordID
	LEFT JOIN symptoms S ON M.symptomsID = S.symptomsID
    LEFT JOIN diagnosis D ON M.diagnosisID = D.diagnosisID
    LEFT JOIN prescription PR ON M.prescriptionID = PR.prescriptionID
    LEFT JOIN insurance I ON P.insuranceID = I.insuranceID
    LEFT JOIN account_balance AB ON P.accountID = AB.accountID;

/*Find patients (and appointment information) who have one appontment */
SELECT P.first_name AS 'patient first name', P.last_name AS 'patient last name',
		A.ap_date AS 'appointment date',
        PR.procedure_name AS 'procedure', PR.cost,
        D.first_name AS 'dentist first name', D.last_name AS 'dentist last name'
FROM appointment A
	JOIN patient P ON A.patientID = A.patientID
    LEFT JOIN procedures PR ON A.procedureID = PR.procedureID
    LEFT JOIN dentist D ON PR.dentistID = D.dentistID
WHERE A.patientID IN
	(SELECT patientID
    FROM appointment A
    GROUP BY A.patientID
    HAVING COUNT(*)<=1)
ORDER BY A.ap_date DESC;



