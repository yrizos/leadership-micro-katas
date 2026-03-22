# Leadership Micro Katas

Software engineers who move into leadership roles lose the feedback loops that made them good. Code compiles or it doesn't. Tests pass, or they fail. Whether you just answered a question someone needed to work through themselves produces no signal. Neither does staying silent when you see a risk nobody named.

Without practice, the defaults win. You code when you should delegate. You answer when you should ask. You avoid the hard conversation because the cost is immediate and the silence feels free. These are not character flaws. They are untrained responses in an environment that does not correct them.

Dave Thomas created _Code Kata_ because programmers perform but rarely practice. Ted Neward created _Architectural Katas_ because design judgment needs the same kind of repetition. Both demonstrated that focused, repeated practice of a single behavior builds skill in ways that study cannot.

Leadership Micro Katas apply the same principle to the transition from individual contributor to tech lead. Each takes under 15 minutes and fits inside a review, a decision, or a conversation that is already happening.

For more on the approach, see [Foundations](docs/foundations.md).

## Katas

This is the catalogue. Each kata is self-contained and can be practiced in any order.

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

Pick one. Any one. Practice it for a week. At the end of the week, write down 3 things:

- Did the moment arise?
- What did you do?
- What would you change?

Then pick another.

## Repository Layout

```
.
├── katas/ # Catalogue of katas
│ ├── 001-assumption-inventory.md
│ ├── 002-pre-mortem-minute.md
│ └── ...
├── docs/ # Background on the kata format
│ └── foundations.md
├── rules/ # Git conventions and writing standards
│ ├── git.md
│ └── writing.md
├── .editorconfig
├── .gitattributes
├── .gitignore
├── AGENTS.md # Entry point; references rule files by activity
├── LICENSE
├── Makefile # Project automation
└── README.md
```
