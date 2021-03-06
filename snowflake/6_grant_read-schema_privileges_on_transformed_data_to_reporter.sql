-- Following guide here: https://discourse.getdbt.com/t/the-exact-privileges-we-grant-outside-of-dbt/439

-- Other References:
--     https://blog.getdbt.com/how-we-configure-snowflake/
--     https://blog.getdbt.com/five-principles-that-will-keep-your-data-warehouse-organized/
--     https://discourse.getdbt.com/t/the-difference-between-users-groups-and-roles-on-postgres-redshift-and-snowflake/429
--     https://www.hashpath.com/2020/11/build-a-modern-data-analytics-stack-from-scratch-in-under-an-hour/

-- Grant read-schema privileges on transformed data to reporter
grant usage on database analytics to reporter;
grant usage on all schemas in database analytics to role reporter;
grant usage on future schemas in database analytics to role reporter;
grant select on all views in database analytics to role reporter;
grant select on all tables in database analytics to role reporter;
grant select on future views in database analytics to role reporter;
grant select on future tables in database analytics to role reporter;
