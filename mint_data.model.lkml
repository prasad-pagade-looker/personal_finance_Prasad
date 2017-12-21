connection: "personal_bq"
include: "*.dashboard.lookml"  # include all dashboards in this project

# include all the views
include: "*.view.lkml"
# include: "/personal_finance_base/*.view.lkml"
include: "/personal_finance_base/mint_base.model.lkml"

explore: transactions {
  from: transactions_custom
  view_name: transactions
  extends: [mint_base_explore]
}
