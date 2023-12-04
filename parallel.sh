#!/bin/bash


# exporting capability path
export LT_CAPABILITY_PATH=config.json

# TestCafe test command to be executed
#COMMAND=(npx testcafe "lambdatest:iPhone 13 Pro Max@15:ios:isReal", "lambdatest:Chrome@74.0:Windows 8" "tests/test1.js")
COMMAND=(npx testcafe "lambdatest:Chrome@75.0:Windows 10","lambdatest:iPhone 13 Pro Max@15:ios:isReal"  "tests/test1.js")

# File to store the output
OUTPUT_FILE="output.txt"

#Command to execute the test and redirect the std output to output.txt file
"${COMMAND[@]}" > "${OUTPUT_FILE}"

echo "Command has finished running. Output has been saved in $OUTPUT_FILE"

FILE="output.txt"

# Declare an array to store session IDs
session_ids=()

# Read each line of the file
while IFS= read -r line; do
    # Check if the line contains 'sessionID='
    if [[ $line == *"sessionID="* ]]; then
        # Extract the session ID
        session_id=$(echo "$line" | grep -o 'sessionID=[^ ]*' | cut -d'=' -f2)
        
        # Store the session ID in the array
        session_ids+=("$session_id")
    fi
done < "$FILE"

# Print each session ID
for id in "${session_ids[@]}"; do
    curl -X POST "https://api.lambdatest.com/automation/api/v1/sessions/${id}/terminal-logs" -H "accept: application/json" -H "Authorization: Basic <YOUR_BASIC_AUTH>" -H "Content-Type: multipart/form-data" -F "file=@output.txt;type=text/plain"
done