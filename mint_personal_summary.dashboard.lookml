- dashboard: mint_personal_summary
  title: "[Mint] Personal Summary"
  layout: newspaper
  elements:
  - name: Income Vs Expenses by Month
    title: Income Vs Expenses by Month
    model: mint_data
    explore: transactions
    type: looker_area
    fields:
    - transactions.date_month
    - transactions.total_spend_amount
    - transactions.total_income_amount
    fill_fields:
    - transactions.date_month
    filters:
      transactions.description: "-Vw Tel Epay"
      transactions.transaction_type: debit,credit
      transactions.is_expensable: 'No'
      transactions.is_transfer: 'No'
      transactions.notes: "-Paid out PTO on final paycheck"
    sorts:
    - transactions.date_month desc
    limit: 5000
    column_limit: 50
    stacking: ''
    show_value_labels: true
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
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: circle_outline
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    series_types: {}
    discontinuous_nulls: false
    focus_on_hover: true
    series_colors:
      transactions.total_spend_amount: red
      transactions.total_income_amount: green
    series_labels: {}
    label_value_format: '"$"#.0,k'
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
      - id: transactions.total_spend_amount
        name: Total Spend Amount
      - id: transactions.total_income_amount
        name: Total Income Amount
    row: 30
    col: 0
    width: 24
    height: 13
  - name: Spend Month over Month
    title: Spend Month over Month
    model: mint_data
    explore: transactions
    type: single_value
    fields:
    - transactions.total_spend_amount
    - transactions.date_month
    fill_fields:
    - transactions.date_month
    filters:
      transactions.is_before_mtd: 'Yes'
      transactions.is_expensable: 'No'
      transactions.is_transfer: 'No'
      transactions.date_month: 3 months
    sorts:
    - transactions.date_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: change
      label: Change %
      expression: "(${transactions.total_spend_amount} - offset(${transactions.total_spend_amount},1))/offset(${transactions.total_spend_amount},1)"
      value_format:
      value_format_name: percent_1
    custom_color_enabled: true
    custom_color: red
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    comparison_label: vs Same Period Last Month
    single_value_title: Total Spending
    row: 0
    col: 0
    width: 8
    height: 4
  - name: Top Spend Merchants
    title: Top Spend Merchants
    model: mint_data
    explore: transactions
    type: looker_pie
    fields:
    - transactions.total_spend_amount
    - merchant_facts.merchant_by_amount_tail
    filters:
      merchant_facts.tail: "<=10"
      transactions.transaction_type: debit
      transactions.is_expensable: 'No'
      transactions.is_transfer: 'No'
      transactions.date_month: this month
    sorts:
    - merchant_facts.merchant_by_amount_tail
    limit: 500
    column_limit: 50
    value_labels: none
    label_type: labPer
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    comparison_label: vs Same Period Last Month
    single_value_title: Total Spending
    inner_radius: 50
    colors: 'palette: Mixed Dark'
    series_colors: {}
    row: 0
    col: 8
    width: 8
    height: 8
  - name: Top Spend Categories
    title: Top Spend Categories
    model: mint_data
    explore: transactions
    type: looker_pie
    fields:
    - category_facts.category_by_amount_tail
    - transactions.total_spend_amount
    filters:
      category_facts.tail: "<=10"
      transactions.transaction_type: debit
      transactions.is_expensable: 'No'
      transactions.is_transfer: 'No'
      transactions.date_month: this month
    sorts:
    - category_facts.category_by_amount_tail
    limit: 500
    column_limit: 50
    value_labels: none
    label_type: labPer
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    comparison_label: vs Same Period Last Month
    single_value_title: Total Spending
    inner_radius: 50
    colors: 'palette: Mixed Dark'
    series_colors: {}
    row: 0
    col: 16
    width: 8
    height: 8
  - name: Income Month over Month
    title: Income Month over Month
    model: mint_data
    explore: transactions
    type: single_value
    fields:
    - transactions.date_month
    - transactions.total_income_amount
    fill_fields:
    - transactions.date_month
    filters:
      transactions.date_month: 3 months
      transactions.transaction_type: credit
      transactions.is_before_mtd: 'Yes'
      transactions.is_expensable: 'No'
      transactions.is_transfer: 'No'
    sorts:
    - transactions.date_month desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: change
      label: Change %
      expression: "(${transactions.total_income_amount} - offset(${transactions.total_income_amount},1))/offset(${transactions.total_income_amount},1)"
      value_format:
      value_format_name: percent_1
    custom_color_enabled: true
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    comparison_label: vs Same Period Last Month
    single_value_title: Total Income
    row: 4
    col: 0
    width: 8
    height: 4
  - name: Subscriptions?
    title: Subscriptions?
    model: mint_data
    explore: transactions
    type: looker_line
    fields:
    - transactions.date_week
    - transactions.total_spend_amount
    - transactions.description
    pivots:
    - transactions.description
    fill_fields:
    - transactions.date_week
    filters:
      transactions.category: "-mortgage & rent,-groceries,-auto insurance,-gas & fuel,-restaurants,-fast\
        \ food"
      transactions.description: -Amazon,-Walgreens,-"Kohl's",-Target
      merchant_facts.total_amount: ">50"
      merchant_facts.volume: ">4"
      transactions.transaction_type: debit
      transactions.is_expensable: 'No'
      transactions.is_transfer: 'No'
      transactions.date_month: 6 months
    sorts:
    - transactions.date_week
    - transactions.description 0
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: cumulative_spend
      label: Cumulative Spend
      expression: running_total(${transactions.total_spend_amount})
      value_format:
      value_format_name: usd
    stacking: ''
    show_value_labels: false
    label_density: 4
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: false
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: false
    truncate_column_names: true
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_labels: legend
    label_type: labPer
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    ordering: none
    show_null_labels: false
    series_types: {}
    comparison_label: vs Same Period Last Month
    single_value_title: Total Spending
    inner_radius: 50
    colors:
    - 'palette: Mixed Dark'
    series_colors: {}
    series_labels:
      transactions.total_spend_amount: Amount
      transactions.date_month: Month
      category_facts.category: Spend Category
    hidden_fields:
    - transactions.total_spend_amount
    hidden_series: []
    focus_on_hover: true
    discontinuous_nulls: true
    row: 43
    col: 0
    width: 24
    height: 12
  - name: Expenses By Category & Month
    title: Expenses By Category & Month
    model: mint_data
    explore: transactions
    type: table
    fields:
    - transactions.total_spend_amount
    - transactions.date_month
    - category_facts.category
    pivots:
    - transactions.date_month
    fill_fields:
    - transactions.date_month
    filters:
      category_facts.tail: "<=25"
      transactions.transaction_type: debit
      transactions.is_expensable: 'No'
      transactions.is_transfer: 'No'
      transactions.date_month: last 6 months
    sorts:
    - transactions.date_month desc 0
    - transactions.total_spend_amount desc 0
    limit: 500
    column_limit: 50
    row_total: right
    dynamic_fields:
    - table_calculation: percent_of_typical
      label: Percent of Typical
      expression: |-
        pivot_index(${transactions.total_spend_amount},1)
        /(${transactions.total_spend_amount:row_total}/6)
      value_format:
      value_format_name: percent_1
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: true
    hide_totals: false
    hide_row_totals: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_ignored_fields:
    - transactions.total_spend_amount
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: true
    value_labels: legend
    label_type: labPer
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    comparison_label: vs Same Period Last Month
    single_value_title: Total Spending
    inner_radius: 50
    colors: 'palette: Mixed Dark'
    series_colors: {}
    series_labels:
      transactions.total_spend_amount: Amount
      transactions.date_month: Month
      category_facts.category: Spend Category
    conditional_formatting:
    - type: less than
      value: ".8"
      background_color: "#94e089"
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
    - type: between
      value:
      - '0.80'
      - '1'
      background_color: "#e0db3a"
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
    - type: greater than
      value: '1'
      background_color: "#f54e38"
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
    - type: equal to
      value: '1'
      background_color: "#e0db3a"
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
    note_state: collapsed
    note_display: hover
    note_text: Review of expense categories based on 6 month trailing average
    row: 8
    col: 0
    width: 24
    height: 22
