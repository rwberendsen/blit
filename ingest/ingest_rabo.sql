DROP TABLE IF EXISTS blit.ingest_rabo_staging;

CREATE TABLE richard.rabo (
    iban VARCHAR(34) NOT NULL
  , munt VARCHAR(4) NOT NULL
  , bic VARCHAR(11) NOT NULL
  , volgnr VARCHAR(18) NOT NULL
  , datum DATE NOT NULL
  , rentedatum DATE NOT NULL
  , bedrag VARCHAR(18) NOT NULL
  , saldo_na_trn VARCHAR NOT NULL
  , tegenrekening_iban VARCHAR(34) NOT NULL
  , naam_tegenpartij VARCHAR(70)
  , naam_uiteindelijke_partij VARCHAR(70)
  , naam_initierende_partij VARCHAR(70)
  , bic_tegenpartij VARCHAR(15)
  , code VARCHAR(4)
  , batch_id VARCHAR(35)
  , transactiereferentie VARCHAR(35) NOT NULL
  , machtigingskenmerk VARCHAR(35)
  , incassant_id VARCHAR(35)
  , betalingskenmerk VARCHAR(35)
  , omschrijving_1 VARCHAR(140)
  , omschrijving_2 VARCHAR(140)
  , omschrijving_3 VARCHAR(140)
  , reden_retour VARCHAR(75)
  , oorspr_bedrag VARCHAR(18)
  , oorspr_munt VARCHAR(11)
  , koers VARCHAR(11)
  , UNIQUE (iban, volgnr)
);


\COPY blit.ingest_rabo_staging FROM %s DELIMITER ',' CSV HEADER ENCODING 'latin-1';
