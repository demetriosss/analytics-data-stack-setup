-- Following guide here: https://discourse.getdbt.com/t/the-exact-privileges-we-grant-outside-of-dbt/439

-- Other References:
--     https://blog.getdbt.com/how-we-configure-snowflake/
--     https://blog.getdbt.com/five-principles-that-will-keep-your-data-warehouse-organized/
--     https://discourse.getdbt.com/t/the-difference-between-users-groups-and-roles-on-postgres-redshift-and-snowflake/429
--     https://www.hashpath.com/2020/11/build-a-modern-data-analytics-stack-from-scratch-in-under-an-hour/

-- NOTHING TO DO HERE!
-- Since you have just set up a database from scratch, you need data to have data landed in the "raw" database before 
-- granting privileges for members of your transformer group to read it. Generally, there are two ways for data to land
-- in "raw":
--     1. Setup a datasource to send new data to the raw database. You'll have to wait for data to arrive.
--     2. Backfill existing data from an existing datasource. For example, backfill data from another database 
--        (e.g., Postgres) or data in a AWS S3 Bucket.

-- Often, it makes the most sense to use an Extract and Load (the EL in ELT) tool (e.g. Stitch, Fivetran) to manage 
-- sending data from source(s) to your raw database. See Seth Rosen's tutorial is an excellent example of how to do
-- this using Fivetran:
--      https://www.hashpath.com/2020/11/build-a-modern-data-analytics-stack-from-scratch-in-under-an-hour/


-- ############ ------- dbt-learn SET UP ONLY ------- ############
-- The following queries load data into the raw databsae in Snowflake for use in dbt-learn exercise. 
-- Conceptually, a similar process may be used to backfill data from other data sources. 
-- NOTE: This script does not configure a data source to send new data as it is generated. 

-- See dbt-learn:
--     https://courses.getdbt.com/courses/take/fundamentals/texts/17703453-loading-training-data-into-your-warehouse

-- create the jaffle_shop schema
create schema raw.jaffle_shop;

-- create customers table in the jaffle_shop schema
create table raw.jaffle_shop.customers
(
    id integer,
    first_name varchar,
    last_name varchar
);

-- Add data from .csv stored in AWS S3 bucket to the customers table in the jaffle_shop schema
copy into raw.jaffle_shop.customers (id, first_name, last_name)
    from 's3://dbt-tutorial-public/jaffle_shop_customers.csv'
        file_format = (
            type = 'CSV'
            field_delimiter = ','
            skip_header = 1
        )
;

-- create orders table in the jaffle_shop schema
create table raw.jaffle_shop.orders
(
  id integer,
  user_id integer,
  order_date date,
  status varchar,
  _etl_loaded_at timestamp default current_timestamp
);

-- Add data from .csv stored in AWS S3 bucket to the orders table in the jaffle_shop schema
copy into raw.jaffle_shop.orders (id, user_id, order_date, status)
    from 's3://dbt-tutorial-public/jaffle_shop_orders.csv'
        file_format = (
            type = 'CSV'
            field_delimiter = ','
            skip_header = 1
        )
;

-- create the stripe schema
create schema raw.stripe;

-- create payment table in the stripe schema
create table raw.stripe.payment (
  id integer,
  orderid integer,
  paymentmethod varchar,
  status varchar,
  amount integer,
  created date,
  _batched_at timestamp default current_timestamp
);

-- Add data from .csv stored in AWS S3 bucket to the payment table in the stripe schema
copy into raw.stripe.payment (id, orderid, paymentmethod, status, amount, created)
from 's3://dbt-tutorial-public/stripe_payments.csv'
    file_format = (
        type = 'CSV'
        field_delimiter = ','
        skip_header = 1
    )
;
