-- Following guide here: https://discourse.getdbt.com/t/the-exact-privileges-we-grant-outside-of-dbt/439

-- Other References:
--     https://blog.getdbt.com/how-we-configure-snowflake/
--     https://blog.getdbt.com/five-principles-that-will-keep-your-data-warehouse-organized/
--     https://discourse.getdbt.com/t/the-difference-between-users-groups-and-roles-on-postgres-redshift-and-snowflake/429
--     https://www.hashpath.com/2020/11/build-a-modern-data-analytics-stack-from-scratch-in-under-an-hour/

-- Create the users
-- NOTE: NEVER commit passwords to a repo!
create user stitch -- or fivetran
    password = '_generate_this_'  -- Replace '_generate_this_' with a password you choose/generate (recommend saving somewhere like 1Password)
    in group loader;

create user claire -- or drew, jeremy, etc
    password = '_generate_this_'  -- Replace '_generate_this_' with a password you choose/generate (recommend saving somewhere like 1Password)
    in group transformer, reporter; -- dbt users get two roles!

create user dbt_cloud
    password = '_generate_this_'  -- Replace '_generate_this_' with a password you choose/generate (recommend saving somewhere like 1Password)
    in group transformer;

create user looker -- or mode or periscope
    password = '_generate_this_'  -- Replace '_generate_this_' with a password you choose/generate (recommend saving somewhere like 1Password)
    in group reporter;
