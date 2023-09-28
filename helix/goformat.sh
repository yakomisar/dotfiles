#!/bin/bash
FILE_PATH="$1"
echo "Formatting file: $FILE_PATH" >> ~/.cache/helix/helix.log # >&2 redirects echo to stderr for debugging purposes
# If the project name is the name of the parent directory of the file
PROJECT_NAME=$(basename $(dirname "$FILE_PATH"))

# Run gofumpt, golines, and goimports-reviser in sequence
# golines -w "$FILE_PATH"
#
golines
goimports
# goimports-reviser -rm-unused -project-name "$PROJECT_NAME" -file-path "$FILE_PATH"
