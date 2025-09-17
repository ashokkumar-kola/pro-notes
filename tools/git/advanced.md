
---

````markdown
# ⚡ Git Advanced

Intermediate and advanced Git commands for daily development and collaboration.

---

## 1. Rebasing
```bash
# Rebase current branch onto main
git rebase main

# Interactive rebase of last 3 commits
git rebase -i HEAD~3

# Abort a rebase in progress
git rebase --abort

# Continue after resolving conflicts
git rebase --continue
````

---

## 2. Cherry-Pick

```bash
# Apply a specific commit from another branch
git cherry-pick <commit-hash>

# Apply multiple commits
git cherry-pick <hash1> <hash2>
```

---

## 3. Tagging

```bash
# List all tags
git tag

# Create a lightweight tag
git tag v1.0

# Create an annotated tag
git tag -a v1.0 -m "Version 1.0 release"

# Push a tag to remote
git push origin v1.0

# Push all tags
git push origin --tags
```

---

## 4. Resetting & Reverting

```bash
# Soft reset (keep changes unstaged)
git reset --soft <commit>

# Mixed reset (default, keep changes in working directory)
git reset <commit>

# Hard reset (discard all changes)
git reset --hard <commit>

# Revert a commit without altering history
git revert <commit>
```

---

## 5. Remote Tracking & Fetching

```bash
# Fetch updates from remote without merging
git fetch

# Fetch a specific branch
git fetch origin <branch-name>

# Set upstream branch for local branch
git branch --set-upstream-to=origin/<branch> <branch>

# Prune deleted remote branches locally
git fetch -p
```

---

## 6. Working with Submodules

```bash
# Add a submodule
git submodule add <repo-url> path/to/submodule

# Initialize submodules
git submodule init

# Update submodules
git submodule update

# Clone repository with submodules
git clone --recurse-submodules <repo-url>
```

---

## 7. Resolving Conflicts

```bash
# After merge or rebase conflict
git status            # See conflicting files
# Edit files to resolve conflicts
git add <file>        # Stage resolved files
git commit            # Complete merge (if not in rebase)
git rebase --continue # Continue rebase after resolving conflicts
```

---

## 8. Git Aliases (Productivity)

```bash
# Shortcut for status
git config --global alias.st status

# Shortcut for log with graph
git config --global alias.lg "log --graph --oneline --all --decorate"

# Shortcut for last commit
git config --global alias.last "log -1 HEAD"
```

---

## 9. Cleaning Up

```bash
# Remove untracked files
git clean -f

# Remove untracked directories as well
git clean -fd

# Dry run to preview what will be removed
git clean -n
```

---

## 10. Advanced Diff & Blame

```bash
# Show differences between commits
git diff <commit1> <commit2>

# Show differences for a file
git diff HEAD~1 file.txt

# See who last modified each line
git blame file.txt
```

---

## 11. Stash Advanced

```bash
# Stash changes with message
git stash save "WIP: feature X"

# Apply stash and drop in one command
git stash pop

# Apply specific stash
git stash apply stash@{2}
```

---

## 12. Interactive Add

```bash
# Stage parts of a file interactively
git add -p <file>
```

---

## 13. Reflog (Undo Anything)

```bash
# Show history of HEAD changes
git reflog

# Reset to previous HEAD state
git reset --hard HEAD@{2}
```

---

## 14. Useful Tips

* Always pull before starting new work: `git pull --rebase`
* Use branches per feature or bug fix
* Keep commit messages descriptive
* Use aliases to speed up repetitive commands
* Backup long-running work using stash or temporary branches

```

