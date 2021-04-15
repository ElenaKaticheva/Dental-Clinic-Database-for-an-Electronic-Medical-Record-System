CREATE USER IF NOT EXISTS reception IDENTIFIED BY '123qwe';

CREATE ROLE IF NOT EXISTS reception_user;

GRANT SELECT, INSERT, UPDATE
ON DentalClinic.adress
TO reception_user;

GRANT reception_user
TO reception;

SET DEFAULT ROLE reception_user to reception;

GRANT SELECT
ON DentalClinic.*
TO reception;

GRANT UPDATE (first_name, last_name, gender, date_of_birth, email, phone, ssn),
	INSERT(first_name, last_name, gender, date_of_birth, email, phone, ssn)
ON DentalClinic.patient
TO reception;

GRANT UPDATE (ap_date),
	INSERT(ap_date)
ON DentalClinic.appointment
TO reception;

