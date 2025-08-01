#!/bin/bash

# deploy.sh - Automate Hugo build and GitHub Pages deployment

# Change Directory 
cd "/Users/juanluisfuentesacosta/Dropbox/projects/personal_website/jlfuentesacosta"

# Run the update of my JMP
~/scripts/update-jmp/update_paper.sh web grubb

# Ensure we're on main branch
git checkout main

# Commit any changes to main (optional - comment out if you want to commit manually)
git add .
git commit -m "Auto-commit before deploy: $(date)" || true
git push origin main

# Clean and rebuild site
rm -fr public
hugo

# Deploy public/ to the jlfuentesacosta.github.io repository
cd public
rm -rf .git
git init
git add .
git commit -m "Auto-deploy: $(date)"
git branch -M main
git remote add origin https://github.com/jlfuentesacosta/jlfuentesacosta.github.io.git  # Changed to your .github.io repo
git push -u origin main --force
cd ..

echo "Deployment complete! Wait 2-5 minutes and test the live site."
echo "Your site will be at: https://jlfuentesacosta.github.io"
