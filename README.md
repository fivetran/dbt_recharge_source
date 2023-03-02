# WORK IN PROGRESS !!
<p align="center">
    <a alt="License"
        href="https://github.com/fivetran/dbt_recharge_source/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.3.0_<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
</p>
# Recharge Source dbt package

# 📣 What does this dbt package do?
- Materializes [Recharge staging tables](https://fivetran.github.io/dbt_recharge_source/#!/overview/recharge_source/models/?g_v=1&g_e=seeds), which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/recharge#schemainformation). These staging tables clean, test, and prepare your Recharge data from [Fivetran's connector](https://fivetran.com/docs/applications/recharge) for analysis by doing the following:
  - Name columns for consistency across all packages and easier analysis
  - Adds freshness tests to source data
  - Adds column-level testing where applicable. For example,  all primary keys are tested for uniqueness and non-null values.
- Generates a comprehensive data dictionary of your Recharge data.
- These tables are designed to work simultaneously with our Recharge transformation package.

# 🎯 How do I use the dbt package?
## Step 1: Prerequisites
To use this dbt package, you must have the following:
- At least one Fivetran Recharge connector syncing data into your destination.
- A **BigQuery**, **Snowflake**, **Redshift**, **PostgreSQL**, or **Databricks** destination.

## Step 2: Install the package
Include the following recharge_source package version in your `packages.yml` file.
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read dbt's Package Management documentation](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yml
packages:
  - package: fivetran/recharge_source
    version: [">=0.1.0", "<0.2.0"]
```

## Step 3: Define database and schema variables
By default, this package runs using your destination and the `recharge` schema. If this is not where your Recharge data is (for example, if your Recharge schema is named `recharge_fivetran`), add the following configuration to your root `dbt_project.yml` file:

```yml
vars:
  recharge_database: your_database_name
  recharge_schema: your_schema_name 
```

## (Optional) Step 5: Additional configurations
<details><summary>Expand for configurations</summary>

### Passing Through Additional Metrics
By default, this package will select `clicks`, `impressions`, and `cost` from the source reporting tables to store into the staging models. If you would like to pass through additional metrics to the staging models, add the following configurations to your `dbt_project.yml` file. These variables allow the pass-through fields to be aliased (`alias`) if desired, but not required. Use the following format for declaring the respective pass-through variables:

> **Note** Ensure you exercised due diligence when adding metrics to these models. The metrics added by default (clicks, impressions, and cost) have been vetted by the Fivetran team maintaining this package for accuracy. There are metrics included within the source reports, for example, metric averages, which may be inaccurately represented at the grain for reports created in this package. You want to ensure whichever metrics you pass through are indeed appropriate to aggregate at the respective reporting levels provided in this package.

```yml
vars:
    recharge__campaign_passthrough_metrics: 
      - name: "new_custom_field"
        alias: "custom_field"
    recharge__ad_group_passthrough_metrics:
      - name: "unique_string_field"
        alias: "field_id"
    recharge__advertised_product_passthrough_metrics: 
      - name: "new_custom_field"
        alias: "custom_field"
      - name: "a_second_field"
    recharge__targeting_keyword_passthrough_metrics:
      - name: "this_field"
    recharge__search_term_ad_keyword_passthrough_metrics:
      - name: "unique_string_field"
        alias: "field_id"
```

### Changing the Build Schema
By default, this package will build the Recharge staging models within a schema titled (<target_schema> + `recharge_source`) in your destination. If this is not where you would like your Amazon Ads staging data to be written, add the following configuration to your root `dbt_project.yml` file:

```yml
models:
    recharge_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```

### Change the source table references
If an individual source table has a different name than the package expects, add the table name as it appears in your destination to the respective variable:

> IMPORTANT: See this project's [`dbt_project.yml`](https://github.com/fivetran/dbt_recharge_source/blob/main/dbt_project.yml) variable declarations to see the expected names.

```yml
vars:
    recharge_<default_source_table_name>_identifier: your_table_name 
```

</details>

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
