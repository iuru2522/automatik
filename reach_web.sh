#!/bin/bash

# Function to check URL availability
check_url() {
    local url="$1"
    local response=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    if [ "$response" == "200" ]; then
        echo "URL $url is reachable."
    else
        echo "URL $url is unreachable (HTTP status code: $response)."
    fi
}

# Read URLs from a text file (one URL per line)
url_file="urls.txt"

if [ ! -f "$url_file" ]; then
    echo "Error: URLs file not found: $url_file"
    exit 1
fi

while IFS= read -r url; do
    if [ -n "$url" ]; then
        check_url "$url"
    fi
done < "$url_file"
