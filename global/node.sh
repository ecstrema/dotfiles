#!/bin/bash

npm install -g npm@latest

# npm packages (using pnpm)
npm i -g  pnpm
pnpm i -g @antfu/ni
ni -g typescript nodemon gh-pages license
