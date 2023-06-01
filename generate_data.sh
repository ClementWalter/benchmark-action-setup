#!/usr/bin/env bash

# Generate a random number between a specified range
function generate_random_number() {
    min=$1
    max=$2
    echo $((RANDOM % (max - min + 1) + min))
}

# Generate a random JSON object
function generate_random_json() {
    local cpu_load_unit="Percent"
    local cpu_load_value=$(generate_random_number 0 100)
    local memory_used_unit="Megabytes"
    local memory_used_value=$(generate_random_number 0 1000)
    local memory_used_range=$(generate_random_number 1 10)
    local tooltip_value=$(generate_random_number 10 50)
    local optional_num=$(generate_random_number 1 200)

    # Generate JSON object
    cat << EOF > random_data.json
[
    {
        "name": "CPU Load",
        "unit": "$cpu_load_unit",
        "value": $cpu_load_value,
        "extra": "$1"
    },
    {
        "name": "Memory Used",
        "unit": "$memory_used_unit",
        "value": $memory_used_value,
        "range": "$memory_used_range",
        "extra": "$1"
    }
]
EOF
}

# Call the function to generate random JSON
generate_random_json "$1"
