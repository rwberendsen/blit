-- This scripts loads a file of ASN transactions without storing duplicate
-- transactions
BEGIN;

-- Create temporary loading table
CREATE TABLE {schema_prefix}_staging.asn_tmp AS
SELECT * FROM {schema_prefix}_staging.asn
WHERE 0=1;

-- Load data into temporary loading table
SET DATESTYLE TO ISO,DMY;
\COPY {schema_prefix}_staging.asn_tmp FROM %s DELIMITER ',' CSV;
SET DATESTYLE TO DEFAULT;

-- Insert transactions into ASN table that are not yet there
INSERT INTO {schema_prefix}_staging.asn
SELECT l.* FROM {schema_prefix}_staging.asn_tmp l
LEFT JOIN {schema_prefix}_staging.asn r
ON l.opdrachtgeversrekening = r.opdrachtgeversrekening
AND l.journaaldatum = r.journaaldatum
AND l.volgnummer_transactie = r.volgnummer_transactie
WHERE r.journaaldatum IS NULL
-- NB: if you want to deduplicate, you need to already know which
-- columns make a table row unique
-- Question: can we always assume all colums together make a table row unique?

-- Delete temporary loading table
DROP TABLE {schema_prefix}_staging.asn_tmp;

COMMIT;
