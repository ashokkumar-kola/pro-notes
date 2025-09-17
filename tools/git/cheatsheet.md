
---

````markdown
# 📌 Git Cheatsheet

A quick reference for Git commands — basics and advanced.

---

## 🔹 Repository Setup
| Action | Command |
|--------|--------|
| Initialize a new repo | `git init` |
| Clone a repository | `git clone <repo_url>` |
| Check status | `git status` |
| Stage all files | `git add .` |
| Stage specific files | `git add src/ App.tsx` |
| Commit staged changes | `git commit -m "message"` |
| Amend last commit | `git commit --amend -m "new message"` |
| View commit history | `git log` |
| View concise commit history | `git log --oneline` |
| View graph of commits | `git log --graph --oneline --all` |

---

## 🔹 Remote Repositories
| Action | Command |
|--------|--------|
| Add remote | `git remote add origin <url>` |
| Verify remotes | `git remote -v` |
| Push to main branch | `git push -u origin main` |
| Push specific branch | `git push origin <branch>` |
| Push all branches | `git push --all` |
| Pull changes | `git pull` |
| Pull specific branch | `git pull origin main` |

---

## 🔹 Branch Management
| Action | Command |
|--------|--------|
| List local branches | `git branch` |
| List remote branches | `git branch -r` |
| Create branch | `git branch <branch>` |
| Switch branch | `git checkout <branch>` |
| Create & switch | `git checkout -b <branch>` |
| Rename current branch | `git branch -m <new-name>` |
| Delete local branch | `git branch -d <branch>` |
| Delete remote branch | `git push origin --delete <branch>` |

---

## 🔹 Undo / Reset / Revert
| Action | Command |
|--------|--------|
| Unstage file | `git reset <file>` |
| Unstage all (keep changes) | `git reset` |
| Discard changes to file | `git checkout -- <file>` |
| Soft reset last commit | `git reset --soft HEAD~1` |
| Hard reset last commit | `git reset --hard HEAD~1` |
| Revert a commit | `git revert <commit>` |

---

## 🔹 Stashing
| Action | Command |
|--------|--------|
| Stash changes | `git stash` |
| Apply latest stash | `git stash apply` |
| Apply & remove stash | `git stash pop` |
| List stashes | `git stash list` |
| Drop specific stash | `git stash drop stash@{0}` |
| Clear all stashes | `git stash clear` |

---

## 🔹 Rebasing & Cherry-Pick
| Action | Command |
|--------|--------|
| Rebase current branch onto main | `git rebase main` |
| Interactive rebase last 3 commits | `git rebase -i HEAD~3` |
| Abort rebase | `git rebase --abort` |
| Continue rebase after conflicts | `git rebase --continue` |
| Cherry-pick a commit | `git cherry-pick <commit>` |

---

## 🔹 Tags
| Action | Command |
|--------|--------|
| List tags | `git tag` |
| Create lightweight tag | `git tag v1.0` |
| Create annotated tag | `git tag -a v1.0 -m "message"` |
| Push tag | `git push origin v1.0` |
| Push all tags | `git push origin --tags` |

---

## 🔹 Remote Tracking & Fetching
| Action | Command |
|--------|--------|
| Fetch updates | `git fetch` |
| Fetch specific branch | `git fetch origin <branch>` |
| Set upstream for local branch | `git branch --set-upstream-to=origin/<branch> <branch>` |
| Prune deleted remote branches | `git fetch -p` |

---

## 🔹 Submodules
| Action | Command |
|--------|--------|
| Add submodule | `git submodule add <repo-url> path/` |
| Initialize submodules | `git submodule init` |
| Update submodules | `git submodule update` |
| Clone with submodules | `git clone --recurse-submodules <repo>` |

---

## 🔹 Useful Productivity Tips
- Use aliases for frequent commands:  
  ```bash
  git config --global alias.st status
  git config --global alias.lg "log --graph --oneline --all --decorate"
  git config --global alias.last "log -1 HEAD"
````

* Always pull before starting new work: `git pull --rebase`
* Use branches per feature/bug
* Keep commit messages descriptive
* Backup work with stash or temporary branches

```

---
