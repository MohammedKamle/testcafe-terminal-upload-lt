#!/bin/bash

# exporting capability path
export LT_CAPABILITY_PATH=config.json

# TestCafe test command to be executed
#COMMAND=(npx testcafe "lambdatest:iPhone 13 Pro Max@15:ios:isReal", "lambdatest:Chrome@74.0:Windows 8" "tests/test1.js")
COMMAND=(npx testcafe "lambdatest:iPhone 13 Pro Max@15:ios:isReal"  "tests/test1.js")

# File to store the output
OUTPUT_FILE="output.txt"

#Command to execute the test and redirect the std output to output.txt file
"${COMMAND[@]}" > "${OUTPUT_FILE}"

#echo "Command has finished running. Output has been saved in $OUTPUT_FILE"


# File containing the output
FILE_PATH="output.txt"

# Extracting the sessionId value
sessionId=$(grep -o 'sessionID=[^ ]*' "$FILE_PATH" | awk -F '=' '{print $2}')

# Printing the sessionId
echo "Session ID: $sessionId"

# api call to upload terminal logs to LT
curl -X POST "https://api.lambdatest.com/automation/api/v1/sessions/${sessionId}/terminal-logs" -H "accept: application/json" -H "Authorization: Basic bW9oYW1tYWRrOmdrcnpUMGlGS2pEamVoWHBNVHpueE0xbEhJWlhTWWpWM0g4TnRrMHMyckNVSkpPM1dV" -H "Content-Type: multipart/form-data" -F "file=@output.txt;type=text/plain"