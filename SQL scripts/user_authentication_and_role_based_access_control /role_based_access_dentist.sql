CREATE USER IF NOT EXISTS dentist IDENTIFIED BY '123qwe';

CREATE ROLE IF NOT EXISTS dentist_user;

GRANT SELECT
ON DentalClinic.*
TO dentist;

GRANT dentist_user
TO dentist;

SET DEFAULT ROLE dentist_user to dentist;

GRANT SELECT, INSERT, UPDATE
ON DentalClinic.prescription
TO dentist_user;

GRANT SELECT, INSERT, UPDATE
ON DentalClinic.diagnosis
TO dentist_user;

GRANT SELECT, INSERT, UPDATE
ON DentalClinic.symptoms
TO dentist_user;

GRANT SELECT, INSERT, UPDATE
ON DentalClinic.procedures
TO dentist_user;
