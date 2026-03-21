# Leadership Micro Katas

Short behavioral drills for software engineers in leadership roles. Each kata targets one untrained default, takes under 15 minutes, and attaches to engineering work already happening: architecture decisions, code reviews, refinements, incident response.

## Katas

| #   | Kata                                                                  |
| --- | --------------------------------------------------------------------- |
| 001 | [Assumption Inventory](katas/001-assumption-inventory.md)             |
| 002 | [Pre-Mortem Minute](katas/002-pre-mortem-minute.md)                   |
| 003 | [Opinion or Observation](katas/003-opinion-or-observation.md)         |
| 004 | [The Blocker Brief](katas/004-blocker-brief.md)                       |
| 005 | [The Tradeoff Statement](katas/005-tradeoff-statement.md)             |
| 006 | [The Question Before the Answer](katas/006-question-before-answer.md) |
| 007 | [The Line Before the Pressure](katas/007-line-before-pressure.md)     |
| 008 | [The Thing You Did Not Say](katas/008-thing-you-did-not-say.md)       |

Pick one. Practice it for a week. At the end of the week, write down 3 things:

- Did the moment arise?
- What did you do?
- What would you change?

Then pick another.

## Structure

```
.
├── .cursor/
│   └── rules/
│       └── agents.mdc              # Cursor rule: forces agents to read AGENTS.md first
├── .githooks/
│   ├── commit-msg                  # Validates commit subject line
│   └── pre-commit                  # Validates branch name
├── katas/                          # Katas
├── rules/
│   ├── git.md                      # Branching, commits, history, destructive git ops
│   └── writing.md                  # Grammar, tone, structure, formatting
├── .editorconfig
├── .gitattributes
├── .gitignore
├── AGENTS.md                       # Entry point; references rule files by activity
├── CLAUDE.md -> AGENTS.md          # Symlink for Claude Code compatibility
├── LICENSE
├── Makefile                        # Project automation
└── README.md
```

## Git Hooks

Hooks under `.githooks/` check branch names and the first line of each commit message against [`rules/git.md`](rules/git.md).

### Install

```bash
make install-hooks    # core.hooksPath → .githooks, chmod hooks
make uninstall-hooks  # unset core.hooksPath
```
