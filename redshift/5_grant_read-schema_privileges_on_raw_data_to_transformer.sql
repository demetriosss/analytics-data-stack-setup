-- Following guide here: https://discourse.getdbt.com/t/the-exact-privileges-we-grant-outside-of-dbt/439

-- Other References:
--     https://blog.getdbt.com/how-we-configure-snowflake/
--     https://blog.getdbt.com/five-principles-that-will-keep-your-data-warehouse-organized/
--     https://discourse.getdbt.com/t/the-difference-between-users-groups-and-roles-on-postgres-redshift-and-snowflake/429
--     https://www.hashpath.com/2020/11/build-a-modern-data-analytics-stack-from-scratch-in-under-an-hour/

-- Grant read-schema privileges on raw data to transformer

-- For EACH SCHEMA:
grant usage on schema raw_stripe to group transformer;
grant select on all tables in schema raw_stripe to group transformer;
-- note that the `for user` clause should be adjusted based on the user who will be creating
-- objects in the schema (which should also be the schema owner).
alter default privileges for user stitch in schema raw_stripe
  grant select on tables to group transformer;
