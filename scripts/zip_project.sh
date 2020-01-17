#!/bin/sh
zip -r latest *
mkdir -p zipped_project
mv latest.zip zipped_project/latest.zip
