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

# Recharge Source dbt package ([Docs](https://fivetran.github.io/dbt_recharge_source/))
# 📣 What does this dbt package do?
- Materializes [Recharge staging tables](https://fivetran.github.io/dbt_recharge_source/#!/overview/recharge_source/models/?g_v=1&g_e=seeds), which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/recharge#schemainformation). These staging tables clean, test, and prepare your Recharge data from [Fivetran's connector](https://fivetran.com/docs/applications/recharge) for analysis by doing the following:
  - Name columns for consistency across all packages and easier analysis
  - Adds freshness tests to source data
  - Adds column-level testing where applicable. For example,  all primary keys are tested for uniqueness and non-null values.
- Generates a comprehensive data dictionary of your Recharge data through the [dbt docs site](https://fivetran.github.io/dbt_recharge_source/).
- These tables are designed to work simultaneously with our [Recharge transformation package](https://github.com/fivetran/dbt_recharge).

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

## Step 4: Disable models for non-existent sources
Your Recharge connector may not sync every table that this package expects. If you do not have the `ONE_TIME_PRODUCT` or `PAYMENT_METHOD` tables synced, add the corresponding variables to your root `dbt_project.yml` file:

```yml
vars:
    recharge_one_time_product_enabled: false   # Disable if you do not have the ONE_TIME_PRODUCT table. Default is True.
    recharge_payment_method_enabled: false   # Disable if you do not have the PAYMENT_METHOD table. Default is True.
```

## (Optional) Step 5: Additional configurations
<details><summary>Expand for configurations</summary>

### Passing Through Additional Columns
This package includes all source columns defined in the macros folder. If you would like to pass through additional columns to the staging models, add the following configurations to your `dbt_project.yml` file. These variables allow for the pass-through fields to be aliased (`alias`) and casted (`transform_sql`) if desired, but not required. Datatype casting is configured via a sql snippet within the `transform_sql` key. You may add the desired sql while omitting the `as field_name` at the end and your custom pass-though fields will be casted accordingly. Use the below format for declaring the respective pass-through variables in your root `dbt_project.yml`.
```yml
vars:
    recharge__address_passthrough_columns: 
      - name: "new_custom_field"
        alias: "custom_field_name"
        transform_sql:  "cast(custom_field_name as int64)"
      - name: "a_second_field"
        transform_sql:  "cast(a_second_field as string)"
    # a similar pattern can be applied to the rest of the following variables.
    recharge__charge_passthrough_columns:
    recharge__charge_line_item_passthrough_columns: 
    recharge__order_passthrough_columns:
    recharge__order_line_passthrough_columns:
    recharge__product_passthrough_columns:
    recharge__subscription_passthrough_columns:
    recharge__subscription_history_passthrough_columns:
```

### Changing the Build Schema
By default, this package will build the Recharge staging models within a schema titled (<target_schema> + `recharge_source`) in your destination. If this is not where you would like your Recharge staging data written, add the following configuration to your root `dbt_project.yml` file:

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
#### 🚨 Snowflake Users 🚨
You may need to provide the case-sensitive spelling of your source tables that are also Snowflake reserved words.

In this package, this would apply to the `ORDER` source. If you are receiving errors for this source, include the following in your `dbt_project.yml` file:
```yml
vars:
  recharge_order_identifier: '"Order"' # as an example, must include this quoting pattern and adjust for your exact casing
```

**Note!** if you have sources defined in your project's yml, the above will not work. Instead you will need to add the following where your order table is defined in your yml:
```yml
sources:
  tables:
    - name: order 
      # Add the below
      identifier: ORDER # Or what your order table is named, being mindful of casing
      quoting:
        identifier: true
```
</details>

## (Optional) Step 6: Orchestrate your models with Fivetran Transformations for dbt Core™
<details><summary>Expand for more details</summary>

Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt). Learn how to set up your project for orchestration through Fivetran in our [Transformations for dbt Core™ setup guides](https://fivetran.com/docs/transformations/dbt#setupguide).
    
</details>

# 🔍 Does this package have dependencies?
This dbt package is dependent on the following dbt packages. Please be aware that these dependencies are installed by default within this package. For more information on the following packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> IMPORTANT: If you have any of these dependent packages in your own `packages.yml` file, we highly recommend that you remove them from your root `packages.yml` to avoid package version conflicts.
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.4.0", "<0.5.0"]

    - package: dbt-labs/dbt_utils
      version: [">=1.0.0", "<2.0.0"]
```
          
# 🙌 How is this package maintained and can I contribute?
## Package Maintenance
The Fivetran team maintaining this package _only_ maintains the latest version of the package. We highly recommend that you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/recharge_source/latest/) of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_recharge_source/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

## Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions! 

We highly encourage and welcome contributions to this package. Check out [this dbt Discourse article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) to learn how to contribute to a dbt package!

# 🏪 Are there any resources available?
- If you have questions or want to reach out for help, refer to the [GitHub Issue](https://github.com/fivetran/dbt_recharge_source/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran or would like to request a new dbt package, fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).
- Have questions or just want to say hi? Book a time during our office hours [on Calendly](https://calendly.com/fivetran-solutions-team/fivetran-solutions-team-office-hours) or email us at solutions@fivetran.com.
