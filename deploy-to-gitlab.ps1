# PowerShell script to deploy the website to GitLab

# Define variables
$gitlabRepoUrl = "https://gitlab.com/porfolio-group1/porfolio-project.git"
$localRepoPath = "$(pwd)"
$commitMessage = "Update website with new features and GitLab CI/CD"

Write-Host "Starting GitLab deployment process..."

# Initialize Git repository if not already initialized
if (-not (Test-Path -Path "$localRepoPath/.git")) {
    Write-Host "Initializing new Git repository..."
    git init
    git branch -M main
}

# Add all files to the staging area
Write-Host "Adding all files to Git staging area..."
git add .

# Commit changes
Write-Host "Committing changes..."
git commit -m $commitMessage

# Set remote origin if not already set
$remote = git remote -v | Select-String -Pattern "origin"
if (-not $remote) {
    Write-Host "Setting GitLab remote origin..."
    git remote add origin $gitlabRepoUrl
}

# Push to GitLab (main branch)
Write-Host "Pushing changes to GitLab (main branch)..."
git push -u origin main

Write-Host "GitLab deployment process completed. Check your GitLab repository for pipeline status."
Write-Host "Your GitLab Pages website will be available at: https://porfolio-group1.gitlab.io/porfolio-project/ (after successful pipeline)"
Write-Host ""
Write-Host "Pipeline Status: Go to https://gitlab.com/porfolio-group1/porfolio-project/-/pipelines to check the build status"
