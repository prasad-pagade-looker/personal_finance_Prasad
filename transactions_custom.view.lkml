include: "/personal_finance_base/transactions.view.lkml"

view: transactions_custom {
  extends: [transactions]
  sql_table_name: mint_database.transactions ;;

  dimension: category {
    type: string
    sql: case when (${amount_signed_raw}=-4000 and ${category_raw}='Check')
              or (${transaction_type}='credit' and substr(${original_description},1,18)='BKOFAMERICA MOBILE')
              then 'Rent, Utilities and Roommates'
    else ${category_raw} end;;
  }

  # dimension: discretionary {
  #   type: yesno
  #   sql: case when  ;;
  # }

  }

# Didn't end up needing a calendar table!  Good thing, it's complex!
# explore: mint_block_andy {
#   extension: required
#   from: calendar
#   view_name: calendar
#   join: mint_data {
#     from: mint_block_andy
#     view_label: "Mint Data"
#     type: left_outer
#     sql_on: ${mint_data.date_raw}=${calendar.date_raw} ;;
#     relationship: one_to_many
#   }
# }
