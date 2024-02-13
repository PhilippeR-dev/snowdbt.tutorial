# proche des macros > compilation pour voir le résulat
{% set models_list = [] %}
{%- for node in graph.nodes.values() if "dim" in node.name -%}
    {{ models_list.append(node.name) }}
{% endfor -%}
{{ models_list }}