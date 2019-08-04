INSERT INTO blit.transaction
SELECT
    to_char(CURRENT_DATE, 'YYYYMMDD') || to_char(volgnummer_transactie, 'FM0000000000') AS serial_number
  , journaaldatum AS processing_date
  , valutadatum AS interest_rate
  , 'asn' AS bank
  , opdrachtgeversrekening AS account
  , valutasoort_rekening AS currency
  , CAST(transactiebedrag * 100 AS INTEGER) AS amount
  , CAST(saldo_rekening_voor_mutatie * 100 AS INTEGER) AS balance_before_transaction
  , tegenrekeningnummer AS contra_account
  , naam_tegenrekening AS name_counterparty
  , NULL AS name_ultimate_party
  , NULL AS name_initiating_party
  , NULL AS bic
  , NULL AS bic_counterparty
  , betalingskenmerk AS payment_reference
  , valutasoort_mutatie AS currency_transaction
  , NULL AS exchange_rate
  , NULL AS amount_original_currency
  , NULL AS reason_return
  , omschrijving AS description
  , NULL AS rabo_internal_classification_code
  , interne_transactiecode AS rabo_internal_classification_code
  , globale_transactiecode AS asn_global_classification_code
  , NULL AS rabo_mandate_reference
  , NULL AS rabo_receiving_party_id 
FROM
  blit.ingest_asn
;
