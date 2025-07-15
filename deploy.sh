#!/bin/bash

# deploy.sh - Automate Hugo build and GitHub Pages deployment

# Change Directory 
cd "/Users/juanluisfuentesacosta/Dropbox/projects/personal_website/jlfuentesacosta"

# Ensure we're on main branch
git checkout main

# Commit any changes to main (optional - comment out if you want to commit manually)
git add .
git commit -m "Auto-commit before deploy: $(date)" || true  # '|| true' ignores if nothing to commit
git push origin main

# Clean and rebuild site
rm -fr public
hugo

# Deploy public/ to gh-pages
cd public
rm -rf .git  # Fresh init to avoid nesting issues
git init
git add .
git commit -m "Auto-deploy: $(date)"
git branch -M gh-pages
git remote add origin https://github.com/jlfuentesacosta/jlfuentesacosta.git
git push -u origin gh-pages --force
cd ..

echo "Deployment complete! Wait 2-5 minutes and test the live site."
echo "Run a manual workflow in GitHub Actions if needed."
