# Leadership Micro Katas

Software engineers who move into leadership roles lose the feedback loops that made them good. Code compiles or it doesn't. Tests pass or they fail. Whether you just answered a question someone needed to work through themselves produces no signal. Neither does staying silent when you saw a risk nobody named.

Without practice, the defaults win. You code when you should delegate. You answer when you should ask. You avoid the hard conversation because the cost is immediate and the silence feels free.

The gap is not unique to leadership. Dave Thomas created Code Kata because programmers perform but rarely practice. Ted Neward created Architectural Katas because design judgment needs the same kind of repetition. Both showed that practicing a single behavior, in a focused setting, builds skill faster than knowledge alone.

Leadership Micro Katas apply the same principle to the transition from individual contributor to tech lead. Each one targets a single untrained behavior, takes under 15 minutes, and fits inside a review, decision, or conversation already happening.

For more details on the approach, see [Foundations](docs/foundations.md).

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
├── .githooks/
│   ├── commit-msg                  # Validates commit subject line
│   └── pre-commit                  # Validates branch name
├── katas/                          # Katas
│   ├── 001-assumption-inventory.md
│   ├── 002-pre-mortem-minute.md
│   └── ...
├── docs/                           # Documentation
│   └── foundations.md              # Background on the kata format
├── rules/                          # Agent rules
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
