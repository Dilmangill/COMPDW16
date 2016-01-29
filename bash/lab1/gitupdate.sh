#!/bin/bash
#this scripts saves all my changes to github

git add -A
git comit -m "$1"
git push
