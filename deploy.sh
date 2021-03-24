#!/usr/bin/env sh

# abort on errors
set -e

# dist
NODE_ENV=production yarn build

# navigate into the dist output directory
cd dist
touch .nojekyll

# if you are deploying to a custom domain
echo 'quest.earth2biomes.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# if you are deploying to https://<USERNAME>.github.io/<REPO>
# git push -f git@github.com:<USERNAME>/<REPO>.git master:gh-pages
git push -f git@github.com:Waspische/agvQuest1.git master:gh-pages


cd -
