#!/bin/bash

echo "=== Starting build ==="
npm run build

echo -e "\n=== Checking for changes after build ==="
node check-build-changes.cjs

echo -e "\n=== Starting deploy ==="
npx wrangler deploy --x-autoconfig

echo -e "\n=== Checking for changes after deploy ==="
git status --short
git diff --name-only
git ls-files --others --exclude-standard

echo -e "\n=== Deploy complete ==="
