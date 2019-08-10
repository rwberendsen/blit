-- This scripts loads a file of ASN transactions without storing duplicate
-- transactions
BEGIN;

-- Create temporary loading table
CREATE TABLE {schema_prefix}_staging.rabo_tmp AS
SELECT * FROM {schema_prefix}_staging.rabo
WHERE 0=1;

-- Load data into temporary loading table
\COPY {schema_prefix}_staging.rabo_tmp FROM %s DELIMITER ',' CSV HEADER
ENCODING 'latin-1';

-- Insert transactions into ASN table that are not yet there
INSERT INTO {schema_prefix}_staging.rabo
SELECT l.* FROM {schema_prefix}_staging.rabo_tmp l
LEFT JOIN {schema_prefix}_staging.rabo r
ON l.iban = r.iban
AND l.volgnr = r.volgnr
WHERE r.iban IS NULL
-- NB: if you want to deduplicate, you need to already know which
-- columns make a table row unique
-- Question: can we always assume all colums together make a table row unique?

-- Delete temporary loading table
DROP TABLE {schema_prefix}_staging.rabo_tmp;

COMMIT;
