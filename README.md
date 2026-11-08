<p align="center"><img src="site/static/icon-192.png" width="96" alt=""></p>

<h1 align="center">Leadership Micro Katas</h1>

<p align="center">Deliberate practice for the parts of tech leadership that do not announce themselves.</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-CC%20BY--SA%204.0-lightgrey.svg" alt="CC BY-SA 4.0"></a>
  <img src="https://img.shields.io/badge/katas-9-blue" alt="9 katas">
</p>

---

The promotion does not come with a manual. The first time you deliver bad news, push back on a deadline, or sit with someone else's uncertainty, you find out what your defaults are, and the ones you brought from engineering rarely fit the new job.

A kata is a small prepared response to a moment that keeps showing up. A ticket lands and your hand moves toward the keyboard. A standup ends with 3 people unclear and nobody saying so. You are about to merge code you would rather not defend out loud.

When the trigger arrives, you give it 10 to 15 minutes, write something down, and carry on with the day. A kata needs no team, coach, or permission, and you do not need to be a tech lead yet to practice one.

The katas started as [habits picked up over 20 years](https://yrizos.com/writing/leadership-micro-katas/) of engineering work, and [training the next group of tech leads](https://blog.talentlms.io/posts/the-job-before-the-job/) at [Epignosis](https://www.epignosishq.com/) gave a reason to write them down. The [thinking behind the format](docs/rationale.md) explains why each kata looks the way it does.

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

Stay with one kata for a week. Keep a short note as you go, with 3 questions:

- Did the moment arise?
- What did I do?
- What would I change?

If the moment never came up, that is also worth knowing. Then move on to the next kata.

## Repository Layout

```text
.
├── katas/              # The catalog
├── docs/
│   └── rationale.md    # Thinking behind the format
├── scripts/            # Scripts run by the Makefile and the Git hooks
├── site/               # The website, built with Hugo
├── AGENTS.md           # Rules for AI agents working in this repository
├── CONTRIBUTING.md     # How to contribute
├── LICENSE
├── Makefile            # Project automation
└── README.md
```

## Contributing

The best contribution is to pick a kata and try it out.

When practice shows where a kata could be clearer, or a moment the catalog does not cover yet, the [contributing guide](CONTRIBUTING.md) explains how to turn that into a change.
