#!/bin/bash

find ./src -type f -exec sed -i 's/\['"$1"'](.*)/['"$1"']('"$2"')/g' {} \;
