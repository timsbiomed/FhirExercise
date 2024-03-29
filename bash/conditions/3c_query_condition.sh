#!/bin/bash
url=http://localhost:$PORT/fhir/

 
# COMBINED condtion and severity
# https://build.fhir.org/search.html#combining
curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --output condition_3.out \
  --request GET \
   "$url/Condition?code=255604002,severity=255604002"

# condition and mild, no results; as expected  MILD???
#   "$url/Condition?code=255604002,severity=255604002"

# condition and sever, returns the one matching patients; as expected GOOD
#  $url/Condition?code=255604002$severity=24484000"



# just condition from 3b RENAL ISUFF GOOD
#  "$url/Condition?code=36225005"

# just severity, Severe GOOD
#  "$url/Condition?severity=24484000"

# just severity, Mild, no results becuase I don't have anhy data with Mild conditions. OK
#  "$url/Condition?severity=255604002"
