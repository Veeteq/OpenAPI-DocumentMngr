#!/bin/bash

echo "Bundla and Deploy API Docs"

redocly bundle -o bundle.yaml openapi/openapi.yaml && \
redocly build-docs bundle.yaml -o index.html