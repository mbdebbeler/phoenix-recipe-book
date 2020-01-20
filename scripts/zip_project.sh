#!/bin/sh
zip -r latest _build/prod/rel/recipebook appspec.yml scripts
mkdir -p zipped_project
mv latest.zip zipped_project/latest.zip
