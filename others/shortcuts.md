# create repo root folder
mkdir -p {templates,languages/{python,javascript,java},frameworks/{react,django},tools,system-design}

# create main files
touch README.md
touch templates/language-template.md

# language files
touch languages/python/{basics.md,advanced.md,cheatsheet.md}
touch languages/javascript/{basics.md,nodejs.md,cheatsheet.md}
touch languages/java/{basics.md,spring.md,cheatsheet.md}

# frameworks
touch frameworks/react/{intro.md,hooks.md,best-practices.md}
touch frameworks/django/{basics.md,advanced.md}

# tools
touch tools/{git.md,docker.md,kubernetes.md,vscode.md}

# system design
touch system-design/{oops.md,design-patterns.md,databases.md,networking.md}
