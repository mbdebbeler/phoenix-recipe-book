#!/bin/sh
mix deps.get --only prod
MIX_ENV=prod mix compile
MIX_ENV=prod mix release
