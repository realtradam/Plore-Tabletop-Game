#!/bin/bash

find ./src -type f -exec sed -i 's/\[.*]('"$2"')/['"$1"']('"$2"')/g' {} \;
