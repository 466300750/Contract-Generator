#!/bin/bash
mkdir -p $1
cd $1
truffle init
npm init
npm install --save-dev solium
var="\"test\": \"./node_modules/.bin/solium --dir contracts && truffle test\""
sed -i '' 's/.*"test": "echo.*/"${var}"/' package.json
solium --init
cat >>./.gitignore <<EOF
"node_modules\/"
"build\/"
"pass"
"keystore"
EOF
echo "node_modules" >> ./.soliumignore
