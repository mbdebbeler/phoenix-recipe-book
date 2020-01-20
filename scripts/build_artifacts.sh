#!/bin/sh
export SECRET_KEY_BASE=$PROD_SECRET_KEY_BASE
export DATABASE_URL=$PROD_DATABASE_URL
mix deps.get --only prod
MIX_ENV=prod mix compile
npm run deploy --prefix ./assets
mix phx.digest
MIX_ENV=prod mix release
