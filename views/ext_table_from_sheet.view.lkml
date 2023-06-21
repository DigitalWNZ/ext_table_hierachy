view: ext_table_from_sheet {
  sql_table_name: `experiment.ext_table_from_sheet`
    ;;

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
    # required_access_grants: [view_category]
  }

  dimension: product {
    type: string
    sql: ${TABLE}.Product ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.Revenue ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
