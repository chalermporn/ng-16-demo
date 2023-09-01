#!/usr/bin/env bash

version="$(node -pe "require('./package.json')['version']")"
now=$(date +'%d/%m/%Y_%T')

echo "Current version: $version"
echo "Current datetime: $now"

read -p "Enter new version : " new_version


if [ "$new_version" ]
then
    echo "$(node -e "let pkg=require('./package.json'); pkg.version='$new_version'; pkg.deployDate='$now'; require('fs').writeFileSync('package.json', JSON.stringify(pkg, null,2))")"
    echo "new version $new_version to set!"
else
    echo "$(node -e "let pkg=require('./package.json'); pkg.deployDate='$now'; require('fs').writeFileSync('package.json', JSON.stringify(pkg, null,2))")"
    echo "deploy-date-time $now only to set!"
fi
