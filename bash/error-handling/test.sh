#!/bin/bash

# Make it fail
cd mydir
status=$?

echo "The date command exits with status: ${status}"
