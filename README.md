# Leadership Micro Katas

Leadership habits form under pressure or they form before it.

Software engineers who move into lead roles lose the feedback loops that made them good. Code compiles or it does not. Tests pass or they fail. Whether you just answered a question someone needed to work through themselves produces no signal. Neither does staying silent when you see a risk nobody named. Without practice, the defaults win.

Each kata is one micro-habit anchored to a moment you are already in. A ticket lands. A standup ends. You are about to ship code you know is not right. The trigger fires, you do a two-minute practice, you produce something written. Then you move on.

No workshop. No coach. No permission required. Just the moment, the practice, and the principle you remember next time.

These katas are for software engineers preparing for a lead role. The habits are meant to be in place before the title arrives.

For the thinking behind the format, see [Rationale](docs/rationale.md).

## Katas

<!-- BEGIN KATAS -->

| #   | Kata                                                                  | Behavior                                                          |
| --- | --------------------------------------------------------------------- | ----------------------------------------------------------------- |
| 001 | [Assumption Inventory](katas/001-assumption-inventory.md)             | Surface hidden assumptions before they become surprises           |
| 002 | [Pre-Mortem Minute](katas/002-pre-mortem-minute.md)                   | Anticipate failure before momentum silences doubt                 |
| 003 | [Opinion or Observation](katas/003-opinion-or-observation.md)         | Ground feedback in evidence, not preference                       |
| 004 | [The Blocker Brief](katas/004-blocker-brief.md)                       | Translate technical constraints into actionable language          |
| 005 | [The Tradeoff Statement](katas/005-tradeoff-statement.md)             | Articulate what a decision costs, not just what it gains          |
| 006 | [The Question Before the Answer](katas/006-question-before-answer.md) | Develop others by resisting the urge to solve for them            |
| 007 | [The Line Before the Pressure](katas/007-line-before-pressure.md)     | Turn escalation from a stress response into a deliberate decision |
| 008 | [The Thing You Did Not Say](katas/008-thing-you-did-not-say.md)       | Confront avoidance by naming what you held back                   |

<!-- END KATAS -->

Pick one. Any one. Practice it for a week. At the end of the week, write down 3 things:

- Did the moment arise?
- What did you do?
- What would you change?

Then pick another.

## Repository Layout

```
.
├── katas/                         # Kata catalog
│ ├── 001-assumption-inventory.md
│ ├── 002-pre-mortem-minute.md
│ └── ...
├── docs/                          # Supporting documentation
│ └── rationale.md                 # Thinking behind the format
├── rules/                         # Standards for agents and human contributors
│ ├── git.md                       # Branching, commit, and history rules
│ └── writing.md                   # Prose and formatting standards
├── AGENTS.md                      # Rules for agents
├── LICENSE
├── Makefile                       # Project automation
└── README.md
```
