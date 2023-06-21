connection: "agolis-allen-first-project"

# include all the views
include: "/views/**/*.view"

datagroup: agolis-allen-first_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: agolis-allen-first_default_datagroup

access_grant: view_category {
  user_attribute: department_multiple_value
  allowed_values: ["product","finance"]
}

explore: ext_table_from_sheet {
  access_filter: {
    field: ext_table_from_sheet.region
    user_attribute: region_multiple_region
  }
}

explore: ext_table_hierachy_seet {
  sql_always_where:
  {% if _user_attributes['lvl'] == "3" %}
    (${third_line}='{{ _user_attributes['employee_id'] }}')
  {% elsif _user_attributes['lvl'] == "2" %}
    (${second_line}='{{ _user_attributes['employee_id'] }}')
  {% elsif _user_attributes['lvl'] == "1" %}
    (${first_line}='{{ _user_attributes['employee_id'] }}')
  {% else %}
    (${employee}='{{ _user_attributes['employee_id'] }}')
  {% endif %}
;;
}
