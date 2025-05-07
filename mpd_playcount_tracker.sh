#!/bin/bash

# Path to JSON file
COUNT_FILE="$HOME/.config/mpd/counts.json"

# Create directory if it doesn't exist
mkdir -p "$(dirname "$COUNT_FILE")"

# Initialize counts.json if it doesn't exist
if [ ! -f "$COUNT_FILE" ]; then
    echo "{}" > "$COUNT_FILE"
fi

# Function to increment play count for a file
increment_count() {
    local file="$1"
    # Escape double quotes
    file=$(echo "$file" | sed 's/"/\\"/g')

    # Use jq to increment the count
    tmp=$(mktemp)
    jq --arg file "$file" '
        .[$file] = (.[$file] // 0) + 1
    ' "$COUNT_FILE" > "$tmp" && mv "$tmp" "$COUNT_FILE"
}

# Listen for song change events using mpc idleloop
mpc idleloop player | while read -r event; do
    if [ "$event" == "player" ]; then
        # Get current song's file path
        file=$(mpc --format %file% current)
        if [ -n "$file" ]; then
            increment_count "$file"
        fi
    fi
done

