#!/bin/bash 
find . -maxdepth 1  -type f ! -name "*.sh" | xargs mv -t outputs/
