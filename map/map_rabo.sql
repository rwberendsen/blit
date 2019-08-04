INSERT INTO blit.transaction
SELECT
    to_char(CAST(volgnr AS INTEGER), 'FM000000000000000000') AS serial_number
  , datum AS processing_date
  , rentedatum AS interest_rate
  , 'rabo' AS bank
  , iban AS account
  , munt AS currency
    -- TODO: support currencies with different number of decimal places according to ISO 4217
  , CAST(replace(replace(bedrag, '.', ''), ',', '') AS INTEGER) AS amount 
  , CAST(replace(replace(saldo_na_trn, '.', ''), ',', '') AS INTEGER)
      - 
    CAST(replace(replace(bedrag, '.', ''), ',', '') AS INTEGER) AS balance_before_transaction 
  , tegenrekening_iban AS contra_account
  , naam_tegenpartij AS name_counterparty
  , naam_uiteindelijke_partij AS name_ultimate_party
  , naam_initierende_partij AS name_initiating_party
  , bic AS bic
  , bic_tegenpartij AS bic_counterparty
  , betalingskenmerk AS payment_reference
  , oorspr_munt AS currency_transaction
  , koers AS exchange_rate
  , oorspr_bedrag AS amount_original_currency
  , reden_retour AS reason_return
  , omschrijving_1 || omschrijving_2 || omschrijving_3 AS description
  , code AS rabo_internal_classification_code
  , NULL AS asn_internal_classification_code
  , NULL AS asn_global_classification_code
  , machtigingskenmerk AS rabo_mandate_reference
  , incassant_id AS rabo_receiving_party_id 
FROM
  blit.ingest_rabo
;

