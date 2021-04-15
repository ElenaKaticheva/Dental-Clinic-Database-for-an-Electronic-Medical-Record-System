CREATE USER IF NOT EXISTS accounting IDENTIFIED BY '123qwe';

CREATE ROLE IF NOT EXISTS accounting_user;

GRANT SELECT
ON DentalClinic.*
TO accounting;

GRANT accounting_user
TO accounting;

SET DEFAULT ROLE accounting_user to accounting;

GRANT SELECT, UPDATE, INSERT
ON DentalClinic.account_balance
TO accounting;

GRANT SELECT, UPDATE, INSERT
ON DentalClinic.billing
TO accounting;

GRANT SELECT, UPDATE, INSERT
ON DentalClinic.insurance_payment
TO accounting;

