-- setup.sql — DuckDB starter
PRAGMA threads=4;
INSTALL json;
LOAD json;

CREATE OR REPLACE TABLE users AS SELECT * FROM read_csv_auto('data/raw/users.csv', header=True);
CREATE OR REPLACE TABLE orders_stage AS SELECT * FROM read_csv_auto('data/raw/orders_v1.csv', header=True, types={order_id: 'INTEGER', user_id:'INTEGER', order_ts:'TIMESTAMP', order_total:'DOUBLE'});
CREATE OR REPLACE TABLE payments_stage AS SELECT * FROM read_csv_auto('data/raw/payments.csv', header=True, types={order_id:'INTEGER', payment_ts:'TIMESTAMP', payment_amount:'DOUBLE'});
CREATE OR REPLACE TABLE events_stage AS SELECT * FROM read_json_auto('data/raw/events.jsonl');

CREATE OR REPLACE TABLE product_catalog_stage AS
SELECT product_id, category, price, COALESCE(currency,'USD') AS currency FROM (
  SELECT * FROM read_csv_auto('data/raw/product_catalog_v1.csv', header=True)
  UNION ALL
  SELECT * FROM read_csv_auto('data/raw/product_catalog_v2.csv', header=True)
);

CREATE OR REPLACE VIEW order_payments AS
SELECT o.order_id, o.user_id, o.order_ts, o.order_total, p.payment_ts, p.payment_amount
FROM orders_stage o
LEFT JOIN payments_stage p USING(order_id);
