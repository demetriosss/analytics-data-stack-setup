# data-stack-setup
A repo for setting up a modern data stack. I shamelessly steal docs, guides, and tutorials from others to try and clearly articulate a path from "I KNOW NOTHING" (where I started) to "I HAVE THE DATA STACK" (where I hope to end). This is my take on the stack based on my work at [Surfline](https://www.surfline.com/). You may have different needs and tooling.

# The Stack
1. **Date warehouse:** Snowflake, Redshift, etc.
1. **Data generation:** Segment, your app/website, Google Analytics, any data source that can send data to a database or that can be extracted using an Extract & Load tool.
1. **Extract & Load:** Stitch, Fivetran, etc.
1. **Data transformation & Analytics Engineering:** dbt
1. **Visualiztion & Reporting:** Periscope, looker, Mode, Chartio, etc.
1. **Self-Service Analytics:** Amplitude

## 1 - Data Warehouse
In the [`/snowflake`](./snowflake) and [`/redshift`](./redshift) folders you will find respective SQL scripts (with comments and instructions) that should be run in numerical order (0 --> 6) to configure your data warehouse. This process follows [the exact privileges Fishtown Analytics grants outside of dbt](https://discourse.getdbt.com/t/the-exact-privileges-we-grant-outside-of-dbt/439).

Personally, setting up Snowflake seems to be the more straightforward of the 2 options. This obviously leaves out Google BigQuery and Azure, but I am not familiar with either.

## 2 - Data generation
WIP

## 3 - Extract & Load
WIP

## 4 - Data transformation & Analytics Engineering
WIP

## 5 - Data transformation & Analytics Engineering
WIP

## 6 - Visualiztion & Reporting
WIP

## 7 - Self-Service Analytics
WIP

## Resources:
- [dbt-learn](https://courses.getdbt.com/collections)
- [Build a modern data analytics stack from scratch in under an hour](https://www.hashpath.com/2020/11/build-a-modern-data-analytics-stack-from-scratch-in-under-an-hour/) (Seth Rosen, Hashpath)
