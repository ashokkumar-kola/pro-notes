---

````markdown
# 📝 Git Basics

A quick reference to the most commonly used Git commands.

---

## 1. Initialize a New Repository
```bash
# Initialize a new Git repository
git init
```

---

## 2. Check Repository Status

```bash
# Show the working tree status
git status
```

---

## 3. Configure User Details

```bash
# Set global user name and email
git config --global user.name "Ashok Kumar Kola"
git config --global user.email "ashokkumar.120300@gmail.com"

# Set project-specific user name and email (overrides global)
git config user.name "Project Name"
git config user.email "project-email@example.com"

# View all global configurations
git config --global --list

# View local repository configuration
git config --list
```

---

## 4. Stage Changes

```bash
# Stage all files for commit
git add .

# Stage specific files or folders
git add src/ package.json App.tsx
```

---

## 5. Commit Changes

```bash
# Commit staged changes with a message
git commit -m "Initial commit: Set up repo-name project"

# Amend the last commit message (optional)
git commit --amend -m "Updated commit message"
```

---

## 6. Remote Repository

```bash
# Add a remote named 'origin'
git remote add origin https://github.com/ashokkumar-kola/repo-name

# Verify current remotes
git remote -v
```

---

## 7. Push Changes to Remote

```bash
# Push changes to the main branch and set upstream tracking
git push -u origin main

# Push to a different branch
git push origin <branch-name>

# Push all branches
git push --all
```

---

## 8. Pull Latest Changes

```bash
# Pull latest changes from the remote main branch
git pull origin main

# Pull latest changes for the current branch
git pull
```

---

## 9. Branch Management

```bash
# List all local branches
git branch

# List remote branches
git branch -r

# Create a new branch
git branch <branch-name>

# Switch to a branch
git checkout <branch-name>

# Create and switch to a new branch
git checkout -b <branch-name>

# Rename current branch
git branch -m <new-branch-name>

# Delete a local branch
git branch -d <branch-name>

# Delete a remote branch
git push origin --delete <branch-name>
```

---

## 10. Log and History

```bash
# View commit history
git log

# View commit history in one line per commit
git log --oneline

# View commit history with graph
git log --graph --oneline --all
```

---

## 11. Undo Changes

```bash
# Unstage a staged file
git reset <file>

# Unstage everything but keep changes
git reset

# Discard local changes to a file
git checkout -- <file>

# Reset the last commit (keep changes unstaged)
git reset --soft HEAD~1

# Reset the last commit and discard changes
git reset --hard HEAD~1
```

---

## 12. Stashing Changes

```bash
# Stash local changes
git stash

# Apply the latest stash
git stash apply

# List stashes
git stash list

# Drop a specific stash
git stash drop stash@{0}

# Clear all stashes
git stash clear
```

---

## 13. Clone a Repository

```bash
# Clone a remote repository
git clone https://github.com/user/repository.git
```

```

---
