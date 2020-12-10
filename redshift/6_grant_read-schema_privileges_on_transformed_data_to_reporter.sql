-- Following guide here: https://discourse.getdbt.com/t/the-exact-privileges-we-grant-outside-of-dbt/439

-- The reporter role should be able to read anything that dbt creates.

-- In Redshift, we implement these via an on-run-end hook. (https://docs.getdbt.com/reference/project-configs/on-run-start-on-run-end)
-- Check out this article about the exact hooks we run! (https://discourse.getdbt.com/t/the-exact-grant-statements-we-use-in-a-dbt-project/430)
