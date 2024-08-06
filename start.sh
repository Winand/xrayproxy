#!/bin/sh

PARSED_URL=$(trurl "$1" --json)
JQ_PARTS='.[0].parts | to_entries[] | (.key | ascii_upcase) + "=" + (.value | tostring)'
JQ_PARAMS='.[0].params[] | (.key | ascii_upcase) + "=" + (.value | tostring)'

while read -r line; do
    export CFG_${line}
done <<EOF
$(echo "$PARSED_URL" | jq -r "$JQ_PARTS")
$(echo "$PARSED_URL" | jq -r "$JQ_PARAMS")
EOF

# echo "$PARSED_URL" | jq -r "$JQ_PARTS" | while read -r line; do
#     export CFG_${line}
# done
# echo "$PARSED_URL" | jq -r "$JQ_PARAMS" | while read -r line; do
#     export CFG_${line}
# done

envsubst < /config_template.json > /config.json
xray -c /config.json
