<h1 align="center">Leadership Micro Katas</h1>

<p align="center">Deliberate practice for the parts of tech leadership that do not announce themselves.</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-CC%20BY--SA%204.0-lightgrey.svg" alt="CC BY-SA 4.0"></a>
  <img src="https://img.shields.io/badge/katas-9-blue" alt="9 katas">
</p>

---

The promotion does not come with a manual. The first time you have to deliver bad news, push back on a deadline, or sit with someone else's uncertainty, you find out what your defaults are. The defaults you brought from engineering rarely fit the job you have just stepped into.

A kata is a small prepared response to a moment that keeps showing up. A ticket lands and your hand moves toward the keyboard. A standup ends with three people unclear and nobody saying so. You are about to merge code you would rather not defend out loud.

The trigger arrives, you give it 10 to 15 minutes, you write something down, and you carry on with the day. No workshop, no coach, no permission needed.

Just a habit quietly in place before the role asks for it.

## Katas

<!-- BEGIN KATAS -->

| #   | Kata                                                                  | Behavior                                                          |
| --- | --------------------------------------------------------------------- | ----------------------------------------------------------------- |
| 001 | [Assumption Inventory](katas/001-assumption-inventory.md)             | Surface hidden assumptions before they become surprises           |
| 002 | [Pre-Mortem Minute](katas/002-pre-mortem-minute.md)                   | Anticipate failure before momentum silences doubt                 |
| 003 | [Opinion or Observation](katas/003-opinion-or-observation.md)         | Ground feedback in evidence, not preference                       |
| 004 | [The Blocker Brief](katas/004-blocker-brief.md)                       | Explain a technical constraint so a non-engineer can act on it    |
| 005 | [The Tradeoff Statement](katas/005-tradeoff-statement.md)             | Articulate what a decision costs, not just what it gains          |
| 006 | [The Question Before the Answer](katas/006-question-before-answer.md) | Develop others by resisting the urge to solve for them            |
| 007 | [The Line Before the Pressure](katas/007-line-before-pressure.md)     | Turn escalation from a stress response into a deliberate decision |
| 008 | [The Thing You Did Not Say](katas/008-thing-you-did-not-say.md)       | Say on paper what you would not say out loud                      |
| 009 | [The Debt Sentence](katas/009-debt-sentence.md)                       | Write down what is wrong before you ship it                       |

<!-- END KATAS -->

Pick one and stay with it for a week. At the end of the week, take a moment to note:

- Did the moment come up?
- What did you do?
- What would you change?

Then move on to another.

## Repository layout

```
.
├── katas/                             # The catalog
│   ├── 001-assumption-inventory.md
│   ├── 002-pre-mortem-minute.md
│   └── ...
├── docs/                              # Supporting docs
│   └── rationale.md                   # Thinking behind the format
├── AGENTS.md                          # Rules for agents working in this repo
├── CONTRIBUTING.md                    # Contribution guidance
├── LICENSE
├── Makefile                           # Project automation
└── README.md
```

## Contributing

Contributions are welcome, and the guidance for getting involved is gathered in [CONTRIBUTING.md](CONTRIBUTING.md).
