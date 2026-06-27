#!/bin/bash
echo "🔍 Checking tasks.json format..."
if command -v jq &> /dev/null; then
    jq '.' tasks.json > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "✅ JSON is valid. Ready to commit!"
    else
        echo "❌ Error: Invalid JSON syntax."
        exit 1
    fi
else
    echo "⚠️ Note: 'jq' not installed, doing basic file check."
    [ -f tasks.json ] && echo "✅ tasks.json exists." || echo "❌ tasks.json missing."
fi
