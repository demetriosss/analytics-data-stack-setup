-- Following guide here: https://discourse.getdbt.com/t/the-exact-privileges-we-grant-outside-of-dbt/439

-- Other References:
--     https://blog.getdbt.com/how-we-configure-snowflake/
--     https://blog.getdbt.com/five-principles-that-will-keep-your-data-warehouse-organized/
--     https://discourse.getdbt.com/t/the-difference-between-users-groups-and-roles-on-postgres-redshift-and-snowflake/429
--     https://www.hashpath.com/2020/11/build-a-modern-data-analytics-stack-from-scratch-in-under-an-hour/


-- Grant privileges to loader and transformer roles

-- create-schema to loader
grant create on database analytics to group loader;
grant select on all tables in schema information_schema to group transformer;
grant select on all tables in schema pg_catalog to group transformer;

-- create-schema to transformer
grant create on database analytics to group transformer;
grant select on all tables in schema information_schema to group transformer;
grant select on all tables in schema pg_catalog to group transformer;
