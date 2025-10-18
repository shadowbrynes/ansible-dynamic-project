#!/bin/bash
set -e
repo_url="$1"
if [ -z "$repo_url" ]; then
  echo "Usage: ./push_to_github.sh <git_repo_url>"
  exit 1
fi
git init
git add .
git commit -m "Initial Dynamic Ansible Project with Vault, Jenkins, Docker, Nginx, Users"
git branch -M main
git remote add origin "$repo_url"
git push -u origin main
