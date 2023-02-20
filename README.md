# WORK IN PROGRESS !!

# ReCharge Source dbt package

# 📣 What does this dbt package do?
- Materializes ReCharge staging tables which leverages data in the format described by [this ERD](https://fivetran.com/docs/applications/recharge#schemainformation). These staging tables clean, test, and prepare your ReCharge data from [Fivetran's connector](https://fivetran.com/docs/applications/recharge) for analysis by doing the following:
  - Name columns for consistency across all packages and easier analysis
  - Adds freshness tests to source data
  - Adds column-level testing where applicable. For example,  all primary keys are tested for uniqueness and non-null values.
- Generates a comprehensive data dictionary of your ReCharge data.
- These tables are designed to work simultaneously with our ReCharge transformation package (coming soon!).

# 🎯 How do I use the dbt package?
## Step 1: Prerequisites
To use this dbt package, you must have the following:
- At least one Fivetran ReCharge connector syncing data into your destination.
- A **BigQuery**, **Snowflake**, **Redshift**, **PostgreSQL**, **Databricks** destination.
    
# 🔍 Does this package have dependencies?
This dbt package is dependent on the following dbt packages. Please be aware that these dependencies are installed by default within this package. For more information on the following packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> IMPORTANT: If you have any of these dependent packages in your own `packages.yml` file, we highly recommend that you remove them from your root `packages.yml` to avoid package version conflicts.
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.3.0", "<0.4.0"]

    - package: dbt-labs/dbt_utils
      version: [">=0.8.0", "<0.9.0"]

    - package: dbt-labs/spark_utils
      version: [">=0.3.0", "<0.4.0"]
```
          
# 🙌 How is this package maintained and can I contribute?
## Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions! 

We highly encourage and welcome contributions to this package. Check out [this dbt Discourse article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) to learn how to contribute to a dbt package!
