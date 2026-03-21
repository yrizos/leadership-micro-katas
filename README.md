# Leadership Micro Katas

Discipline over instinct.

## Structure

```
.
├── .cursor/
│   └── rules/
│       └── agents.mdc         # Cursor rule: forces agents to read AGENTS.md first
├── .githooks/
│   ├── commit-msg             # Validates commit subject line
│   └── pre-commit             # Validates branch name
├── rules/
│   ├── code.md                # Error handling, naming, complexity, boundaries
│   ├── git.md                 # Branching, commits, history, destructive git ops
│   └── writing.md             # Grammar, tone, structure, formatting
├── AGENTS.md                  # Entry point; references rule files by activity
├── CLAUDE.md -> AGENTS.md     # Symlink for Claude Code compatibility
├── LICENSE
├── Makefile                   # Hook installation and project automation
└── README.md
```

## Git Hooks

Hooks under `.githooks/` check branch names and the first line of each commit message against [`rules/git.md`](rules/git.md).

### Install

```bash
make install-hooks    # core.hooksPath → .githooks, chmod hooks
make uninstall-hooks  # unset core.hooksPath
```
