-- Following guide here: https://discourse.getdbt.com/t/the-exact-privileges-we-grant-outside-of-dbt/439

-- Other References:
--     https://blog.getdbt.com/how-we-configure-snowflake/
--     https://blog.getdbt.com/five-principles-that-will-keep-your-data-warehouse-organized/
--     https://discourse.getdbt.com/t/the-difference-between-users-groups-and-roles-on-postgres-redshift-and-snowflake/429
--     https://www.hashpath.com/2020/11/build-a-modern-data-analytics-stack-from-scratch-in-under-an-hour/

-- Create the users
-- NOTE: NEVER commit passwords to a repo!
create user stitch_user -- or fivetran_user
    password = '_generate_this_'  -- Replace '_generate_this_' with a password you choose/generate (recommend saving somewhere like 1Password)
    default_warehouse = loading
    default_role = loader; 

create user greg -- or claire, drew, jeremy, etc.
    password = '_generate_this_'  -- Replace '_generate_this_' with a password you choose/generate (recommend saving somewhere like 1Password)
    default_warehouse = transforming
    default_role = transformer;

create user dbt_cloud_user
    password = '_generate_this_'  -- Replace '_generate_this_' with a password you choose/generate (recommend saving somewhere like 1Password)
    default_warehouse = transforming
    default_role = transformer;

create user periscope_user -- or mode_user, looker_user, etc.
    password = '_generate_this_'  -- Replace '_generate_this_' with a password you choose/generate (recommend saving somewhere like 1Password)
    default_warehouse = reporting
    default_role = reporter;

-- then grant these the share role to each user
grant role loader to user stitch_user; -- or fivetran_user
grant role transformer to user dbt_cloud_user;
grant role transformer to user greg; -- or drew, jeremy
grant role reporter to user periscope_user; -- or mode_user, looker_user, etc.
