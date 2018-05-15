#!/bin/bash

# SERVICE wikibase:label { bd:serviceParam wikibase:language 'en'. }

QUERY=$(cat <<'EOF'
SELECT ?artificial_physical_object ?artificial_physical_objectLabel ?material_used ?material_usedLabel ?subclass_of ?subclass_ofLabel ?use ?useLabel ?has_part ?has_partLabel ?has_quality ?has_qualityLabel 
WHERE {
  hint:Query hint:optimizer "None" .

  SERVICE wikibase:label {
    bd:serviceParam wikibase:language "en" .
  }
  {?artificial_physical_object wdt:P279* wd:Q39546} 
  UNION {?artificial_physical_object wdt:P279* wd:Q42889} 
  UNION {?artificial_physical_object wdt:P279* wd:Q1357761} 
  UNION {?artificial_physical_object wdt:P279* wd:Q16798631}
  UNION {?artificial_physical_object wdt:P279* wd:Q3406743} 
  UNION {?artificial_physical_object wdt:P279* wd:Q987767}
  UNION {?artificial_physical_object wdt:P279* wd:Q19603939} 
  UNION {?artificial_physical_object wdt:P279* wd:Q21029893} 
  UNION {?artificial_physical_object wdt:P279* wd:Q143518} 
  UNION {?artificial_physical_object wdt:P279* wd:Q185785} 
  UNION {?artificial_physical_object wdt:P279* wd:Q207977} 
  UNION {?artificial_physical_object wdt:P279* wd:Q208443} 
  UNION {?artificial_physical_object wdt:P279* wd:Q839546}. 

  ?artificial_physical_object rdfs:label ?artificial_physical_objectLabel2 .
  ?artificial_physical_object wdt:P279 ?subclass_of.
  {?artificial_physical_object wdt:P186 ?material_used}
  UNION {?artificial_physical_object wdt:P366 ?use}
  UNION {?artificial_physical_object wdt:P527 ?has_part}.

  FILTER((LANG(?artificial_physical_objectLabel2)) = 'en')
  FILTER(!STRSTARTS(?artificial_physical_objectLabel2, 'Q'))
}
EOF
)

curl -X POST http://18.216.86.45:9999/bigdata/sparql --data-urlencode "query=$QUERY" -H 'Accept:text/csv' 
