#!/bin/bash

jar_file=$(find target -maxdepth 1 -type f -name "*.jar" ! -name "original*.jar" | head -n 1)
echo "$jar_file"
if [ -z "$jar_file" ]; then
    echo "No JAR files are located in the target directory."
    exit 1
fi

java -jar "$jar_file"
