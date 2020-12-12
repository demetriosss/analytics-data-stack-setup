-- Following guide here: https://discourse.getdbt.com/t/the-exact-privileges-we-grant-outside-of-dbt/439

-- Other References:
--     https://blog.getdbt.com/how-we-configure-snowflake/
--     https://blog.getdbt.com/five-principles-that-will-keep-your-data-warehouse-organized/
--     https://discourse.getdbt.com/t/the-difference-between-users-groups-and-roles-on-postgres-redshift-and-snowflake/429
--     https://www.hashpath.com/2020/11/build-a-modern-data-analytics-stack-from-scratch-in-under-an-hour/

-- Grant privileges to loader and transformer roles
grant all on database raw to role loader;
grant create schema on database analytics to role transformer;

-- From step 6 in dbt guide (https://discourse.getdbt.com/t/the-exact-privileges-we-grant-outside-of-dbt/439):
--     "Since transformer is creating all the relations within the analytics database,
--      that role will have all privileges on these relation automatically."
-- But I found that I had to explicity grant all privileges to transformer role to get dbt-cloud working.
grant all on database analytics to role transformer;
