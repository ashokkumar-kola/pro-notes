
📘 Markdown Notes Style Guide


1. Headings — Hierarchy & Structure
   
# H1 → Title of the doc (e.g., "Python Basics")
## H2 → Main sections (e.g., "1. Introduction")
### H3 → Sub-sections (e.g., "Variables")
#### H4 → Sub-sub-sections (rare, edge cases/examples)

💡 Rule: Each .md file should have 1 H1 at the top, and then use ## onward.

---

1. Text Styling — Highlighting Key Points
   
Bold → important concepts:
**Object-Oriented Programming** is a paradigm based on classes and objects.

Italics → new terms, emphasis:
Python is an *interpreted* language.

Inline code → keywords, commands, code elements:
Use `pip install` to install packages.

Blockquote → highlight notes, tips, or warnings:
> ⚠️ Always use virtual environments in Python to avoid dependency conflicts.

---

1. Lists — Organizing Information

Unordered list for bullets:
- Feature 1
- Feature 2
- Feature 3

Ordered list for steps:
1. Install Python
2. Create a virtual environment
3. Run your first script

Nested lists:
- Data Types
  - Numbers
  - Strings
  - Lists

---

4. Code Blocks — For Snippets
   
Use triple backticks (```) with language name for syntax highlighting:

```python
def greet(name):
    return f"Hello, {name}"
```

---

1. Tables — For Comparisons

| Feature         | Python         | Java       |
|-----------------|----------------|------------|
| Typing          | Dynamic        | Static     |
| Execution       | Interpreted    | Compiled   |
| Use cases       | Data Science   | Enterprise |

---

6. Sections You Should Use Consistently
   
Follow the same pattern per doc (like a book chapter):

# Title (Language/Framework/Tool)

## 1. Introduction
- What is it?
- Why use it?

## 2. Installation & Setup
Steps to install and configure.

## 3. Basics
- Syntax
- Core concepts
- Simple examples

## 4. Advanced Concepts
- Patterns
- Edge cases
- Best practices

## 5. Cheat Sheet
Quick commands/snippets.

## 6. Projects / Examples
Mini-projects, hands-on.

## 7. Resources
Links to official docs, tutorials.

---

7. Emphasizing Important Info

✅ Do’s
❌ Don’ts
⚡ Quick tips
🛠️ Tools

✅ Use `venv` for Python projects  
❌ Don’t install packages globally  
⚡ Shortcut: `python -m venv venv && source venv/bin/activate`  

---

8. Links & Images

Link:
[Python Official Docs](https://docs.python.org/3/)

Image (for diagrams/screenshots):
![Architecture Diagram](./images/python-architecture.png)

🔗 Linking to Specific Sections in GitHub

## 1. Linking to a Heading in Markdown
GitHub auto-generates anchors for headings.

Format:
```markdown
[Link text](./path/to/file.md#heading-text)


---

9. Collapsible Sections (Optional, GitHub-only)

Good for hiding extra details:

<details>
<summary>Click to expand example</summary>

```python
print("Hello World")
```

</details> 

---

10. Checklist — For TODOs

- [x] Learn Python basics
- [ ] Complete Django project
- [ ] Explore Kubernetes

---

11. Icons

🔹 General Highlights
    📌 → Important point
    ⚡ → Quick tip / Shortcut
    💡 → Idea / Insight
    ❓ → Question to think about
    🔍 → Explanation / Deep dive

🔹 Warnings & Status
    ⚠️ → Warning / Gotcha
    ❗ → Critical issue
    ✅ → Correct / Best practice
    ❌ → Wrong / Don’t do this
    ⏳ → Work in progress
    🚧 → Under construction

🔹 Sections / Organization
    📝 → Notes
    📖 → Documentation / Reading material
    🛠️ → Tools / Utilities
    📂 → Folder / File reference
    🔗 → Link / Reference
    🎯 → Goal / Key takeaway

🔹 Programming & Dev Context
    💻 → Code snippet / Example
    🐛 → Bug / Debugging
    🧪 → Testing
    📦 → Package / Dependency
    🔧 → Configuration / Setup
    🐍 → Python-specific
    ☕ → Java-specific
    ⚙️ → System/DevOps
    
🔹 Learning & Projects
    🚀 → New project / Getting started
    🎓 → Learning point
    🛡️ → Security consideration
    🏗️ → Architecture / Design pattern
    🔑 → Key concept
    🎥 → Video tutorial
    🌐 → Web resource

🔹 Productivity
    ⌨️ → Keyboard shortcut
    🕒 → Time-saving tip
    📊 → Table / Comparison
    📈 → Performance improvement

---

