#!/bin/bash

cd /opt/my-home-cctv/

# ↓ https://github.com/BreeeZe/rpos/tree/master#how-to-install-on-a-raspberry-pi
# ↓ 	step 3
git clone https://github.com/BreeeZe/rpos.git
cd rpos
npm install
# ↓ 	step 4
npx gulp
# ↓ 	step 5
sh setup_v4l2rtspserver.sh
# ↓ 	step 6
jq -s '.[0] + .[1]' ./rposConfig.sample-picam.json ../rposConfig.json > ./rposConfig.json
# ↓ 	step 7
node rpos.js
