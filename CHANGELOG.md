# dbt_recharge_source v0.2.0
[PR #12](https://github.com/fivetran/dbt_recharge_source/pull/12) includes the following updates:
## Features
- For Fivetran Recharge connectors created on or after June 18, 2024, the `ORDER` source table has been renamed to `ORDERS`. The package will now use the `ORDERS` table if it exists or `ORDER` if not.  
  - If you have both versions but wish to use the `ORDER` table instead, you can set the variable `recharge__using_orders` to False.
  - See the [June 2024 connector update notes](https://fivetran.com/docs/connectors/applications/recharge/changelog#june2024) for more details.

## Under the Hood:
- Updated the pull request templates.
- Included auto-releaser GitHub Actions workflow to automate future releases.

# dbt_recharge_source v0.1.1
[PR #10](https://github.com/fivetran/dbt_recharge_source/pull/10) includes the following updates:
## Bug fixes
- In `stg_recharge__subscription_history`, updated model to use the source's `updated_at` column to determine most recent record. This column is part of the primary key for the history table and is definitive, while the prior `_fivetran_synced` was less meaningful.

# dbt_recharge_source v0.1.0
🎉 This is the initial release of this package! 🎉
## 📣 What does this dbt package do?
- Materializes [Recharge staging tables](https://fivetran.github.io/dbt_recharge_source/#!/overview/recharge_source/models/?g_v=1&g_e=seeds), which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/recharge#schemainformation). These staging tables clean, test, and prepare your Recharge data from [Fivetran's connector](https://fivetran.com/docs/applications/recharge) for analysis by doing the following:
  - Names columns for consistency across all packages and for easier analysis
  - Adds freshness tests to source data
  - Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
- Generates a comprehensive data dictionary of your Recharge data through the [dbt docs site](https://fivetran.github.io/dbt_recharge_source/).
- These tables are designed to work simultaneously with our [Recharge transformation package](https://github.com/fivetran/dbt_recharge).
- For more information refer to the [README](/README.md).
