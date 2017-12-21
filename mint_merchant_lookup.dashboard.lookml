- dashboard: mint_merchant_lookup
  title: "[Mint] Merchant Lookup"
  layout: newspaper
  elements:
  - name: Total Spend over time
    title: Total Spend over time
    model: mint_data
    explore: transactions
    type: looker_column
    fields:
    - transactions.total_spend_amount
    - transactions.date_month
    fill_fields:
    - transactions.date_month
    filters:
      transactions.is_transfer: 'No'
      transactions.is_expensable: 'No'
      transactions.transaction_type: debit
    sorts:
    - transactions.date_month desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: transactions.average_spend_amount
        name: Average Spend Amount
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: transactions.total_spend_amount
        name: Total Spend Amount
    series_types: {}
    reference_lines: []
    listen:
      Timeframe: transactions.date_date
      Merchant: transactions.description
    row: 0
    col: 7
    width: 17
    height: 7
  - name: Merchant Detail
    title: Merchant Detail
    model: mint_data
    explore: transactions
    type: looker_single_record
    fields:
    - transactions.description
    - merchant_facts.avg_amount
    - merchant_facts.frequency
    - merchant_facts.days_since_last_charge
    - merchant_facts.days_a_customer
    - merchant_facts.duration_between_first_and_last_transaction
    - merchant_facts.first_transaction
    - merchant_facts.last_transaction
    - merchant_facts.max_amount
    - merchant_facts.total_amount
    - merchant_facts.volume
    filters:
      transactions.is_transfer: 'No'
      transactions.is_expensable: 'No'
      transactions.transaction_type: debit
    sorts:
    - merchant_facts.first_transaction desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: time_a_customer
      label: Time A Customer
      expression: if(${merchant_facts.days_a_customer}>365,concat(round(${merchant_facts.days_a_customer}/365,1),"
        years"),concat(${merchant_facts.days_a_customer}," days"))
      value_format:
      value_format_name:
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Timeframe: transactions.date_date
      Merchant: transactions.description
    row: 0
    col: 0
    width: 7
    height: 7
  filters:
  - name: Timeframe
    title: Timeframe
    type: date_filter
    default_value: NOT NULL
    model: mint_data
    explore:
    field:
    listens_to_filters: []
    allow_multiple_values: true
  - name: Merchant
    title: Merchant
    type: field_filter
    default_value:
    model: mint_data
    explore: transactions
    field: transactions.description
    listens_to_filters: []
    allow_multiple_values: true
