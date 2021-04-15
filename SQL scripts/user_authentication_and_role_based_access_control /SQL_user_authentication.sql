CREATE USER Dental_Clinic_User@localhost IDENTIFIED BY 'qwe123';
GRANT SELECT, INSERT, UPDATE ON DentalClinic.* TO Dental_Clinic_User@localhost
WITH GRANT OPTION;


