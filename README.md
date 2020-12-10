# analytics-data-stack-setup
A repo for setting up a modern analytics data stack. This is my take on the stack based on my work at [Surfline](https://www.surfline.com/). You may have different needs and tooling.

I shamelessly steal docs, guides, and tutorials from others to try and clearly articulate a path from `I KNOW NOTHING` (where I started) to `I HAVE THE DATA STACK` (where I hope to end). 

# The Stack
This list is not exhaustive, but attempts to show the broad categories for a modern analytics data stack. 
1. **Date Warehouse:** [Snowflake](https://www.snowflake.com/), [Redshift](https://aws.amazon.com/redshift/), etc.
1. **Data Generation:** A Customer Data Platfrom (CDP) like [Segment](https://segment.com/) for website or app events, [Google Analytics](https://analytics.google.com/analytics/web/), [Facebook Ads](https://www.facebook.com/business/ads), any data source that can send data to a database or that can be extracted using an Extract & Load tool.
1. **Extract & Load:** [Stitch](https://www.stitchdata.com/), [Fivetran](https://fivetran.com/), etc.
1. **Data Transformation & Analytics Engineering:** [dbt](https://www.getdbt.com/)
1. **Visualization & Reporting:** [Sisense](https://www.sisense.com/product/data-teams/) (formerly Periscope), [Looker](https://looker.com/), [Mode](https://mode.com/), [Chartio](https://chartio.com/), etc.
1. **Self-Service Product Analytics:** [Amplitude](https://amplitude.com/)
1. **Experimentation (A/B testing):** [Split](https://split.io/)

## 1 - Data Warehouse
In the [`/snowflake`](./snowflake) and [`/redshift`](./redshift) folders you will find respective SQL scripts (with comments and instructions) that should be run in numerical order (0 --> 6) to configure your data warehouse. This process follows [the exact privileges Fishtown Analytics grants outside of dbt](https://discourse.getdbt.com/t/the-exact-privileges-we-grant-outside-of-dbt/439).

Personally, setting up Snowflake seems to be the more straightforward of the 2 options. This obviously leaves out Google BigQuery and Azure, but I am not familiar with either.

## 2 - Data Generation
WIP

## 3 - Extract & Load
WIP

## 4 - Data Transformation & Analytics Engineering
WIP

## 5 - Visualization & Reporting
WIP

## 6 - Self-Service Analytics
WIP

## 7 - Experimentation (A/B testing)
WIP

## Resources:
- [dbt-learn](https://courses.getdbt.com/collections)
- [Build a modern data analytics stack from scratch in under an hour](https://www.hashpath.com/2020/11/build-a-modern-data-analytics-stack-from-scratch-in-under-an-hour/) (Seth Rosen, Hashpath)
