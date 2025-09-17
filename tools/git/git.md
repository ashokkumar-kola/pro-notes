# 📘 GIT

---

## Introduction
- `Distributed Version Control System`

- `Version Control`
- `Collaboration`

- `Manage` projects with Repositories
- `Clone` a project to work on a local copy
- `Control` and `track` changes with Staging and Committing
- `Branch` and `Merge` to allow for work on different parts and versions of a project
- `Pull` the latest version of the project to a local copy
- `Push` local updates to the main project

### VERSION CONTROL 

- `local Version Control`
- `Centralized Version Control System`
- `Distributed Version Control System`

---

## Installation & Setup
    ```bash
    sudo apt update
    sudo apt install git
    git --version
    ```

### Configure Git
git config --global user.name "sample-user"
git config --global user.email "sample@gmail.com"

Note: Use global to set the username and e-mail for every repository on your computer.
If you want to set the username/e-mail for just the current repo, you can remove global

To verify the configuration:
git config --list
    
---

## GIT INITIALIZATION

```bash
git init 
```

- Initialized empty Git repository in /Users/user/myproject/.git/

git status

- On branch master

- No commits yet

- Untracked files:
-   (use "git add ..." to include in what will be committed)
-     index.html

- nothing added to commit but untracked files present (use "git add" to track)

---

# Git Staging Environment
- `Staged files are files that are ready to be committed to the repository you are working on.`

- `A README.md file that describes the repository (recommended for all repositories)`

git add index.html
git add --all
git add -A
git add .

git status
# On branch master

# No commits yet

# Changes to be committed:
#   (use "git rm --cached ..." to unstage)
#     new file: index.html


git restore --staged README.txt 

git reset logid

git stash
git stash pop
git stash clear

git diff
git diff --staged

---

# Git Commit
- Adding commits keep track of our progress and changes as we work. 
- `Git considers each commit change point or "save point".`
- `It is a point in the project you can go back to if you find a bug, or want to make a change.`
#
- `The -a option will automatically stage every changed, already tracked file.`
--------------------------------------------------------------------------------- 
- `Note: Short status flags are:`
    - `?? - Untracked files`
    - `A  - Files added to stage`
    - `M  - Modified files`
    - `D  - Deleted files`

git commit -m "First release of Hello World!"

# -m "message"- adds a message.

# [master (root-commit) 221ec6e] First release of Hello World!
#  3 files changed, 26 insertions(+)
#  create mode 100644 README.md
#  create mode 100644 bluestyle.css
#  create mode 100644 index.html


git commit -a -m "Updated index.html with a new line"
git commit -am "Updated index.html with a new line"

# [master 09f4acd] Updated index.html with a new line
# 1 file changed, 1 insertion(+)


# Warning: Skipping the Staging Environment is not generally recommended.
# Skipping the stage step can sometimes make you include unwanted changes.


git status --short

# M index.html
---

# Git Commit Log
- `To view the history of commits for a repository`
  
git log


# commit 09f4acd3f8836b7f6fc44ad9e012f82faf861803 (HEAD -> master)
# Author: w3schools-test 
# Date:   Fri Mar 26 09:35:54 2021 +0100

#     Updated index.html with a new line

# commit 221ec6e10aeedbfd02b85264087cd9adc18e4b26
# Author: w3schools-test 
# Date:   Fri Mar 26 09:13:07 2021 +0100

#     First release of Hello World!

---

# 3. Branching and Merging
- `A branch is a new/separate version of the main repository.`

#
- 🔹 Key Benefits:
    - Enables parallel development.
    - Keeps the main branch stable.
    - Facilitates easy collaboration.
  
# Create a New Branch:
git branch <branch-name>

# View all branches
git branch

# Switch to a Branch:
git checkout <branch-name>
git switch <branch-name>

# Detached Head state - Switch to a Branch:
git checkout <id>

# Create and Switch in One Step:
git checkout -b <branch-name>
git switch -c <branch-name>

# Merge a Branch into Main:
git checkout main  # or git switch main
git merge <branch-name> 

# Resolving Merge Conflicts
git merge <branch-name>
git add <conflicted-file>
git commit -m "Resolved merge conflict"

# delete the branch
git branch -d <branch-name>


# Moves a branch to a new base (replaying commits)

git rebase <branch>

git rebase --continue

git push --force

---

### 🔹 Branching Strategies
<details>
<summary>🔹 Branching Strategies</summary>
    <pre>
        A good branching strategy keeps the codebase clean and helps teams collaborate efficiently.
        1. Git Flow (Ideal for Large Teams)
            main: Stable production-ready code.
            develop: Integrates new features before release.
            feature/*: Each feature has its own branch (merged into develop).
            release/*: Prepares a new release.
            hotfix/*: Fixes critical issues in production.

        2. GitHub Flow (Simpler, Common for CI/CD)
            main: Always deployable.
            Create a feature branch, work on changes, and open a pull request (PR).
            After review, merge into main.

        3. Trunk-Based Development (Fast Development)
            Developers commit directly to main or short-lived branches.
            Continuous integration ensures stability.

        -🔹 Which to Use?
            Use Git Flow for large projects with scheduled releases.
            Use GitHub Flow for fast, continuous deployment.
            Use Trunk-Based Development for frequent commits and minimal branches.
    </pre>
</details>

<details>
<summary>🔹 Handling Large Files</summary>
    <pre>
        - Use .gitignore
        - Use Git LFS (Large File Storage)
            - git lfs install
            - git lfs track "*.psd" - Track specific file types
        - Use External Storage
    </pre>
</details>

---

# Ignore Files
- `A .gitignore file tells Git which files/folders to ignore.`

# Ignore system files
.DS_Store
Thumbs.db

# Ignore dependency folders
node_modules/
vendor/

# Ignore logs and environment files
*.log
.env


# 🔹 Create .gitignore in the root directory and commit it:
# touch .gitignore
# git add .gitignore
# git commit -m "Add .gitignore"

---

# Working with Remote Repositories

### Adding, Fetching, Pulling, and Pushing Changes to a Remote

# Adding a Remote Repository
git remote add origin <repository_url>

git remote -v # Verify remotes:

#  Fetching Changes from a Remote
git fetch origin

#  Pulling Changes from a Remote
git pull origin <branch-name>

# Pushing Changes to a Remote
git push origin <branch-name>

# First-time push for a new branch:
git push --set-upstream origin <branch-name>
git push -u origin <branch-name>


### Discarding Changes in the Working Directory

# Discard Unstaged Changes (Modified but Not Added)
git checkout -- <file>

# Remove Staged Changes (Before Commit)
git reset HEAD <file>

# Discard All Uncommitted Changes
git reset --hard

# Remove Untracked Files and Folders
git clean -fd # -f (force) removes files, -d removes directories.


### Pull Request (PR) Workflow

# Create a Branch
git checkout -b feature/your-feature

# Make Changes & Commit
git add .
git commit -m "feat: add new feature"

# Push the Branch to Remote
git push origin feature/your-feature

# Open a Pull Request

# Reviewing PRs and Making Changes Based on Feedback

---

# Git Help

- Note: If you find yourself stuck in the list view, `SHIFT + G` to jump the end of the list, 
- then `q` to exit the view.
- 
# See all the available options for the specific command
git command -help  

# To open the relevant Git manual page
git command --help
 
# See all possible commands
git help --all


<details>
    <summary>See Options for a Specific Command</summary>
    <pre>
        git commit -help
        usage: git commit [] [--] ...

            -q, --quiet           suppress summary after successful commit
            -v, --verbose         show diff in commit message template

        Commit message options
            -F, --file      read message from file
            --author      override author for commit
            --date          override date for commit
            -m, --message 
                                commit message
            -c, --reedit-message 
                                reuse and edit message from specified commit
            -C, --reuse-message 
                                reuse message from specified commit
            --fixup       use autosquash formatted message to fixup specified commit
            --squash      use autosquash formatted message to squash specified commit
            --reset-author        the commit is authored by me now (used with -C/-c/--amend)
            -s, --signoff         add a Signed-off-by trailer
            -t, --template 
                                use specified template file
            -e, --edit            force edit of commit
            --cleanup       how to strip spaces and #comments from message
            --status              include status in commit message template
            -S, --gpg-sign[=]
                                GPG sign commit

        Commit contents options
            -a, --all             commit all changed files
            -i, --include         add specified files to index for commit
            --interactive         interactively add files
            -p, --patch           interactively add changes
            -o, --only            commit only specified files
            -n, --no-verify       bypass pre-commit and commit-msg hooks
            --dry-run             show what would be committed
            --short               show status concisely
            --branch              show branch information
            --ahead-behind        compute full ahead/behind values
            --porcelain           machine-readable output
            --long                show status in long format (default)
            -z, --null            terminate entries with NUL
            --amend               amend previous commit
            --no-post-rewrite     bypass post-rewrite hook
            -u, --untracked-files[=]
                                show untracked files, optional modes: all, normal, no. (Default: all)
            --pathspec-from-file 
                                read pathspec from file
            --pathspec-file-nul   with --pathspec-from-file, pathspec elements are separated with NUL character
    </pre>

</details>

<details>
    <summary> Git All commands </summary>

    <pre>
        $ git help --all
        See 'git help ' to read about a specific subcommand

        Main Porcelain Commands
        add                  Add file contents to the index
        am                   Apply a series of patches from a mailbox
        archive              Create an archive of files from a named tree
        bisect               Use binary search to find the commit that introduced a bug
        branch               List, create, or delete branches
        bundle               Move objects and refs by archive
        checkout             Switch branches or restore working tree files
        cherry-pick          Apply the changes introduced by some existing commits
        citool               Graphical alternative to git-commit
        clean                Remove untracked files from the working tree
        clone                Clone a repository into a new directory
        commit               Record changes to the repository
        describe             Give an object a human readable name based on an available ref
        diff                 Show changes between commits, commit and working tree, etc
        fetch                Download objects and refs from another repository
        format-patch         Prepare patches for e-mail submission
        gc                   Cleanup unnecessary files and optimize the local repository
        gitk                 The Git repository browser
        grep                 Print lines matching a pattern
        gui                  A portable graphical interface to Git
        init                 Create an empty Git repository or reinitialize an existing one
        log                  Show commit logs
        maintenance          Run tasks to optimize Git repository data
        merge                Join two or more development histories together
        mv                   Move or rename a file, a directory, or a symlink
        notes                Add or inspect object notes
        pull                 Fetch from and integrate with another repository or a local branch
        push                 Update remote refs along with associated objects
        range-diff           Compare two commit ranges (e.g. two versions of a branch)
        rebase               Reapply commits on top of another base tip
        reset                Reset current HEAD to the specified state
        restore              Restore working tree files
        revert               Revert some existing commits
        rm                   Remove files from the working tree and from the index
        shortlog             Summarize 'git log' output
        show                 Show various types of objects
        sparse-checkout      Initialize and modify the sparse-checkout
        stash                Stash the changes in a dirty working directory away
        status               Show the working tree status
        submodule            Initialize, update or inspect submodules
        switch               Switch branches
        tag                  Create, list, delete or verify a tag object signed with GPG
        worktree             Manage multiple working trees

        Ancillary Commands / Manipulators
        config               Get and set repository or global options
        fast-export          Git data exporter
        fast-import          Backend for fast Git data importers
        filter-branch        Rewrite branches
        mergetool            Run merge conflict resolution tools to resolve merge conflicts
        pack-refs            Pack heads and tags for efficient repository access
        prune                Prune all unreachable objects from the object database
        reflog               Manage reflog information
        remote               Manage set of tracked repositories
        repack               Pack unpacked objects in a repository
        replace              Create, list, delete refs to replace objects

        Ancillary Commands / Interrogators
        annotate             Annotate file lines with commit information
        blame                Show what revision and author last modified each line of a file
        bugreport            Collect information for user to file a bug report
        count-objects        Count unpacked number of objects and their disk consumption
        difftool             Show changes using common diff tools
        fsck                 Verifies the connectivity and validity of the objects in the database
        gitweb               Git web interface (web frontend to Git repositories)
        help                 Display help information about Git
        instaweb             Instantly browse your working repository in gitweb
        merge-tree           Show three-way merge without touching index
        rerere               Reuse recorded resolution of conflicted merges
        show-branch          Show branches and their commits
        verify-commit        Check the GPG signature of commits
        verify-tag           Check the GPG signature of tags
        whatchanged          Show logs with difference each commit introduces

        Interacting with Others
        archimport           Import a GNU Arch repository into Git
        cvsexportcommit      Export a single commit to a CVS checkout
        cvsimport            Salvage your data out of another SCM people love to hate
        cvsserver            A CVS server emulator for Git
        imap-send            Send a collection of patches from stdin to an IMAP folder
        p4                   Import from and submit to Perforce repositories
        quiltimport          Applies a quilt patchset onto the current branch
        request-pull         Generates a summary of pending changes
        send-email           Send a collection of patches as emails
        svn                  Bidirectional operation between a Subversion repository and Git

        Low-level Commands / Manipulators
        apply                Apply a patch to files and/or to the index
        checkout-index       Copy files from the index to the working tree
        commit-graph         Write and verify Git commit-graph files
        commit-tree          Create a new commit object
        hash-object          Compute object ID and optionally creates a blob from a file
        index-pack           Build pack index file for an existing packed archive
        merge-file           Run a three-way file merge
        merge-index          Run a merge for files needing merging
        mktag                Creates a tag object
        mktree               Build a tree-object from ls-tree formatted text
        multi-pack-index     Write and verify multi-pack-indexes
        pack-objects         Create a packed archive of objects
        prune-packed         Remove extra objects that are already in pack files
        read-tree            Reads tree information into the index
        symbolic-ref         Read, modify and delete symbolic refs
        unpack-objects       Unpack objects from a packed archive
        update-index         Register file contents in the working tree to the index
        update-ref           Update the object name stored in a ref safely
        write-tree           Create a tree object from the current index

        Low-level Commands / Interrogators
        cat-file             Provide content or type and size information for repository objects
        cherry               Find commits yet to be applied to upstream
        diff-files           Compares files in the working tree and the index
        diff-index           Compare a tree to the working tree or index
        diff-tree            Compares the content and mode of blobs found via two tree objects
        for-each-ref         Output information on each ref
        for-each-repo        Run a Git command on a list of repositories
        get-tar-commit-id    Extract commit ID from an archive created using git-archive
        ls-files             Show information about files in the index and the working tree
        ls-remote            List references in a remote repository
        ls-tree              List the contents of a tree object
        merge-base           Find as good common ancestors as possible for a merge
        name-rev             Find symbolic names for given revs
        pack-redundant       Find redundant pack files
        rev-list             Lists commit objects in reverse chronological order
        rev-parse            Pick out and massage parameters
        show-index           Show packed archive index
        show-ref             List references in a local repository
        unpack-file          Creates a temporary file with a blob's contents
        var                  Show a Git logical variable
        verify-pack          Validate packed Git archive files

        Low-level Commands / Syncing Repositories
        daemon               A really simple server for Git repositories
        fetch-pack           Receive missing objects from another repository
        http-backend         Server side implementation of Git over HTTP
        send-pack            Push objects over Git protocol to another repository
        update-server-info   Update auxiliary info file to help dumb servers

        Low-level Commands / Internal Helpers
        check-attr           Display gitattributes information
        check-ignore         Debug gitignore / exclude files
        check-mailmap        Show canonical names and email addresses of contacts
        check-ref-format     Ensures that a reference name is well formed
        column               Display data in columns
        credential           Retrieve and store user credentials
        credential-cache     Helper to temporarily store passwords in memory
        credential-store     Helper to store credentials on disk
        fmt-merge-msg        Produce a merge commit message
        interpret-trailers   Add or parse structured information in commit messages
        mailinfo             Extracts patch and authorship from a single e-mail message
        mailsplit            Simple UNIX mbox splitter program
        merge-one-file       The standard helper program to use with git-merge-index
        patch-id             Compute unique ID for a patch
        sh-i18n              Git's i18n setup code for shell scripts
        sh-setup             Common Git shell script setup code
        stripspace           Remove unnecessary whitespace

        External commands
        askyesno
        credential-helper-selector
        flow
        lfs
    </pre>
</details>


---

git merge emergency-fix
# Updating 09f4acd..dfa79db
# Fast-forward
#  index.html | 2 +-
#  1 file changed, 1 insertion(+), 1 deletion(-)


git branch -d emergency-fix
# Deleted branch emergency-fix (was dfa79db).


git remote add origin url 
remote -v  - view


git push origin master
git push origin master -f # Force push

git clone url 

git remote add upstream url
push upstream url

git fetch --all --prune
git reset --hard uptsream/main

---

## 5. Cheat Sheet


---

## 6. Projects / Examples


---

## 7. Resources


---








