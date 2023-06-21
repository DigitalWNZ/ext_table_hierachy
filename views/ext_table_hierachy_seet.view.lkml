view: ext_table_hierachy_seet {
  sql_table_name: `agolis-allen-first.experiment.ext_table_hierachy_seet`
    ;;

  dimension: class {
    type: string
    sql: ${TABLE}.Class ;;
  }

  dimension: employee {
    type: string
    sql: ${TABLE}.Employee ;;
  }

  dimension: first_line {
    type: string
    sql: ${TABLE}.First_line ;;
    drill_fields: [employee]
  }

  dimension: score {
    type: number
    sql: ${TABLE}.Score ;;
  }

  dimension: second_line {
    type: string
    sql: ${TABLE}.Second_line ;;
    drill_fields: [first_line]
  }

  dimension: third_line {
    type: string
    sql: ${TABLE}.Third_line ;;
    drill_fields: [second_line]
  }

  dimension: access_filter_dimension {
    type: string
    sql: case
          when {{ _user_attributes['lvl'] }}=3 then ${third_line}
          when {{ _user_attributes['lvl'] }}=2 then ${second_line}
          when {{ _user_attributes['lvl'] }}=1 then ${first_line}
          else ${employee}
        end;;
    # drill_fields: [drill_dimension]
  }

  dimension: sub_dimension {
    type: string
    sql: case
          when {{ _user_attributes['lvl'] }}=3 then ${second_line}
          when {{ _user_attributes['lvl'] }}=2 then ${first_line}
          else ${employee}
        end;;
    # drill_fields: [drill_dimension]
  }



  measure: count {
    type: count
    drill_fields: []
  }
}
