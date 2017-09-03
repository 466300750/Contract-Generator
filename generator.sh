#!/bin/bash
mkdir -p $1
cd $1
brew list jq || brew install jq
truffle init
npm init
npm install --save-dev solium
jq '.scripts.test = "./node_modules/.bin/solium --dir contracts && truffle test"' < ./package.json | tee ./aa.json
cat ./aa.json | tee ./package.json
rm -f ./aa.json
solium --init
cat >>./.gitignore <<EOF
"node_modules\/"
"build\/"
"pass"
"keystore"
EOF
echo "node_modules" >> ./.soliumignore
