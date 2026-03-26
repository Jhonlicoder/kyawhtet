# GitLab Pages Deployment Guide for Kyaw Htet's Portfolio Website

This guide provides step-by-step instructions on how to deploy your personal portfolio website to GitLab Pages. GitLab Pages allows you to publish static websites directly from a GitLab repository, making it a powerful tool for showcasing your work.

## 1. Prerequisites

Before you begin, ensure you have the following:

*   **GitLab Account:** An active GitLab account. If you don't have one, you can sign up at [https://gitlab.com](https://gitlab.com).
*   **Git Installed:** Git command-line tool installed on your local machine. You can download it from [https://git-scm.com/downloads](https://git-scm.com/downloads).
*   **Website Files:** Your portfolio website files (HTML, CSS, JS, images) are ready.

## 2. Create a New GitLab Project

1.  Log in to your GitLab account.
2.  On the left sidebar, click on **Menu > Projects > View all projects**.
3.  Click the **New project** button.
4.  Select **Create blank project**.
5.  Fill in the project details:
    *   **Project name:** `porfolio-project`
    *   **Project slug:** This will be automatically generated based on your project name.
    *   **Visibility Level:** Set to `Public` if you want your website to be publicly accessible, or `Private` if you prefer to keep it private.
6.  Click **Create project**.

## 3. Initialize Local Git Repository and Push to GitLab

Follow these steps to initialize a Git repository in your website's root directory and push your code to the newly created GitLab project.

1.  **Navigate to your website directory:**
    Open your terminal or PowerShell and navigate to the root directory of your `kyawhtet-website` folder:
    ```bash
    cd /path/to/your/kyawhtet-website
    ```

2.  **Initialize Git (if not already done):**
    ```bash
    git init
    ```

3.  **Add all files to staging:**
    ```bash
    git add .
    ```

4.  **Commit your changes:**
    ```bash
    git commit -m "Initial commit: Kyaw Htet Portfolio Website"
    ```

5.  **Add GitLab remote:**
    ```bash
    git remote add origin https://gitlab.com/porfolio-group1/porfolio-project.git
    ```

6.  **Push to GitLab:**
    ```bash
    git push -u origin main
    ```
    *Note: GitLab's default branch is often `main`. If your local branch is `master`, you might need to use `git push -u origin master` or rename your branch to `main` using `git branch -M main`.*

## 4. GitLab CI/CD Configuration for Pages

GitLab Pages uses GitLab CI/CD to build and deploy your website. A `.gitlab-ci.yml` file in your repository's root directory defines the deployment process. We have already created this file for you.

**`.gitlab-ci.yml` content:**

```yaml
pages:
  stage: deploy
  script:
    - mkdir .public
    - cp -r * .public
    - mv .public public
  artifacts:
    paths:
      - public
  only:
    - main
```

**Explanation:**

*   **`pages:`**: This defines a special job named `pages` that GitLab recognizes for Pages deployment.
*   **`stage: deploy`**: This job runs in the `deploy` stage of the CI/CD pipeline.
*   **`script:`**: These commands are executed by the GitLab Runner:
    *   `mkdir .public`: Creates a temporary directory.
    *   `cp -r * .public`: Copies all your website files into the `.public` directory.
    *   `mv .public public`: Renames `.public` to `public`. GitLab Pages specifically looks for static assets in a folder named `public`.
*   **`artifacts:`**: Specifies that the `public` directory should be saved as a build artifact.
*   **`paths: - public`**: Declares the `public` directory as the artifact that GitLab Pages will serve.
*   **`only: - main`**: This job will only run when changes are pushed to the `main` branch.

## 5. Using the PowerShell Deployment Script

For convenience, a PowerShell script (`deploy-to-gitlab.ps1`) has been provided to automate the Git commands. You can use this script to push your updates to GitLab.

**`deploy-to-gitlab.ps1` content:**

```powershell
# PowerShell script to deploy the website to GitLab

# Define variables
$gitlabRepoUrl = "https://gitlab.com/kyawhtet.mdy.single1/kyawhtet-portfolio.git" # Replace with your actual GitLab repository URL
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
Write-Host "Your GitLab Pages website will be available at: https://kyawhtet.mdy.single1.gitlab.io/kyawhtet-portfolio/ (after successful pipeline)"
```

**How to use the script:**

1.  **Open PowerShell:** Navigate to your `kyawhtet-website` directory in PowerShell.
2.  **Run the script:**
    ```powershell
    .\deploy-to-gitlab.ps1
    ```
    *Note: You might need to adjust the `$gitlabRepoUrl` variable in the script to match your specific GitLab project URL if it's different from the example.*

## 6. Verify Deployment on GitLab Pages

After pushing your code to GitLab (either manually or using the script), a CI/CD pipeline will automatically start. You can monitor its progress:

1.  Go to your GitLab project.
2.  On the left sidebar, click on **CI/CD > Pipelines**.
3.  You should see a running or completed pipeline for your latest commit.
4.  Once the pipeline successfully completes, your website will be live on GitLab Pages.

Your website will be available at:
`https://porfolio-group1.gitlab.io/porfolio-project/`

## 7. Next Steps: Google Search Visibility

To make your website easily discoverable on Google and other search engines, we have already implemented basic SEO optimizations in your `index.html` file, including:

*   **`<title>` tag:** Optimized with relevant keywords.
*   **`<meta name="description">`:** A concise summary of your website's content.
*   **`<meta name="keywords">`:** Relevant keywords for search engines.
*   **`<link rel="canonical">`:** Helps search engines understand the preferred version of a page.
*   **Open Graph (`og:`) tags:** For better social media sharing previews.

To further improve your search engine ranking:

*   **Submit to Search Engines:** Submit your website's sitemap to Google Search Console and Bing Webmaster Tools.
*   **High-Quality Content:** Regularly update your portfolio with new, high-quality projects and descriptions.
*   **Backlinks:** Get other reputable websites to link to your portfolio.
*   **Social Media Promotion:** Share your website on your social media channels.

By following these steps, your professional portfolio website will be live on GitLab Pages and optimized for search engine visibility. Good luck!
