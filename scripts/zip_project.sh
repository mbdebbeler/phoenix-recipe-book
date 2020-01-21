#!/bin/sh
mkdir -p aws_deploy
cp deploy_tarball/recipebook.tar.gz aws_deploy
mv appspec.yml aws_deploy
