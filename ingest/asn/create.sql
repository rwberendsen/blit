DROP TABLE IF EXISTS {schema_prefix}_staging.asn;

CREATE TABLE {schema_prefix}_staging.asn (
    boekingsdatum DATE NOT NULL
  , opdrachtgeversrekening VARCHAR(18) NOT NULL
  , tegenrekeningnummer VARCHAR(34) NULL
  , naam_tegenrekening VARCHAR(70) NULL
  , adres VARCHAR(42) NULL
  , postcode VARCHAR(42) NULL
  , plaats VARCHAR(42) NULL
  , valutasoort_rekening VARCHAR(3) NOT NULL
  , saldo_rekening_voor_mutatie NUMERIC(12,2) NOT NULL
  , valutasoort_mutatie VARCHAR(3) NOT NULL
  , transactiebedrag NUMERIC(12,2) NOT NULL
  , journaaldatum DATE NOT NULL
  , valutadatum DATE NOT NULL
  , interne_transactiecode SMALLINT NULL
  , globale_transactiecode VARCHAR(3) NULL
  , volgnummer_transactie INTEGER NOT NULL CHECK (volgnummer_transactie >= 0)
  , betalingskenmerk VARCHAR(18) NULL
  , omschrijving VARCHAR(520)
  , afschriftnummer SMALLINT
  , UNIQUE (opdrachtgeversrekening, journaaldatum, volgnummer_transactie)
);
