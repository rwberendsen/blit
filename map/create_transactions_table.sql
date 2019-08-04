DROP TABLE IF EXISTS blit.transaction;

CREATE TABLE blit.transaction (
    serial_number VARCHAR(18) NOT NULL
  , processing_date DATE NOT NULL
  , interest_date DATE NOT NULL
  , bank VARCHAR (18) NOT NULL
  , account VARCHAR(34) NOT NULL
  , currency VARCHAR(4) NOT NULL
  , amount INTEGER NOT NULL
  , balance_before_transaction INTEGER NOT NULL
  , contra_account VARCHAR(34)
  , name_counterparty VARCHAR(70)
  , name_ultimate_party VARCHAR(70)
  , name_initiating_party VARCHAR(70)
  , bic VARCHAR(11)
  , bic_counterparty VARCHAR(15)
  , payment_reference VARCHAR(35)
  , currency_transaction VARCHAR(11)
  , exchange_rate VARCHAR(11)
  , amount_original_currency VARCHAR(18)
  , reason_return VARCHAR(75)
  , description VARCHAR(520)
  , rabo_internal_classification_code VARCHAR(4)
  , asn_internal_classification_code SMALLINT
  , asn_global_classification_code VARCHAR(3)
  , rabo_mandate_reference VARCHAR(35)
  , rabo_receiving_party_id VARCHAR(35)
  , UNIQUE(account, serial_number)
 ); 
