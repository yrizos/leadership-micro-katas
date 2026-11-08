# AGENTS.md

Mandatory rules for AI coding agents. Human contributors use `CONTRIBUTING.md`.

## Boundaries

### Always

- Read `README.md` at the start of any repository task, and read a file before editing it.
- Verify branch, directory and runtime state before acting on assumptions.
- Do only what was explicitly asked, with the smallest diff that satisfies it. Do not rewrite surrounding content or add content the user did not ask for.
- Ask instead of proceeding when confidence is below 95%.
- When a change affects something documented in the README, flag it and propose the update as a separate step, unless README updates are already in scope. Violation: a kata is renamed or its `behavior` frontmatter changes, and the agent does not flag that `make readme` must regenerate the kata table.

### Confirm First

- A plan for multi-step or multi-file changes.
- Changes to headings, titles or structure the user wrote.
- Deleting or overwriting content the user did not name.
- README content updates triggered by other changes. Regenerating the kata table with `make readme` after kata metadata changes needs no confirmation.
- Git operations that rewrite history or carry unusual risk, including amending the last commit, squashing on an unshared branch, force pushing to a personal branch and interactive rebase on a local branch.
- Destructive commands, for which the user must also name the exact target. Destructive Git operations include force pushing, deleting branches the agent does not own, resetting or rewriting pushed commits, `git restore`, `git checkout -- <path>`, `git reset --hard` and `git clean`.

### Never

- Rename, remove or rewrite content outside the stated scope.
- Rename a heading the user wrote. APA title case corrections are allowed.
- Expand scope. If something else needs attention, mention it and wait.
- Treat questions, complaints or frustration as implicit requests to act.
- Present guesses as facts. State only established knowledge or explicitly sourced claims, and flag uncertainty.
- Invent citations, statistics, quotes or attributions. Omit or flag anything that cannot be verified.
- Replace the user's chosen approach, pattern or phrasing with an alternative unless asked. Violation: the user writes a kata trigger in an informal register, and the agent rewrites it in formal prose because it considers the original unclear.

## Git

- Follow the branch and commit conventions in `CONTRIBUTING.md`.
- Commit only when the user explicitly asks.
- Inspect the staged diff before writing the commit message, which must describe what is staged rather than the agent's memory of the work.
- Each commit is 1 logical change. Do not combine unrelated changes, mix refactors with behavior changes or batch independent fixes.

## Writing

These rules apply to all prose in the repository. Where rules overlap, the stricter one applies.

The default audience is technically literate professionals, unless the user specifies otherwise. Assume expertise and do not explain known concepts. The voice resembles an experienced colleague explaining something that happened at work. It is direct, reflective and analytical, with warmth and conversational touches when natural.

### Mechanics

- Use US English spelling. Avoid US idioms and colloquialisms, because the audience is global.
- Do not use em dashes, ellipses or curly quotes.
- Avoid parentheses unless removing them changes the meaning.
- Use articles where grammar requires them.
- Prefer active voice when it makes the sentence clearer.
- Outside `katas/`, use digits for numbers, but write "a" or "an" for a single unspecified instance ("write a sentence," not "write 1 sentence"). Also use parallel structure in lists and series, and do not bold entire sentences.

### Structure and Formatting

- Lead with the most important point.
- Use descriptive headings for anything longer than a few paragraphs, never generic labels. Headings and titles use APA title case.
- Do not use horizontal rules as section separators or decorative formatting. Bold sparingly.
- Use bullets only for independent, parallel items, not for explanatory or sequential prose.
- Use backticks only for identifiers, commands, file paths and literal values.
- Code fences specify a language. Use plain fences for non-code structured text.

### Sentences and Paragraphs

- Keep sentences economical while preserving natural rhythm and grammatical completeness.
- Vary sentence structure and length. Short sentences give emphasis, and longer ones layer related ideas or explain circumstances and reasoning. Do not chain short declarative statements into a monotonous, punchy sequence. Combine related ideas into compound sentences.
- Give each paragraph 1 point and split one that covers 2 ideas. Paragraphs develop connected thoughts, and a natural, precise paragraph is preferable to several disconnected statements.
- Every paragraph connects to the one before it, without "Furthermore," "Additionally" or "Moreover."
- Do not repeat concepts, words or phrases across sentences, paragraphs or sections unless it is deliberate for rhetorical effect. If a word appears more than twice without purpose, rewrite.

### Language

- Use direct, familiar language. Prefer ordinary words over abstract terminology, management jargon or unnecessarily formal expressions.
- Sound like a person communicating clearly, not someone performing a writing style. Writing should be interesting because the situation and reasoning are meaningful, not because the prose calls attention to itself.
- Avoid artificial contrasts, repetitive sentence patterns and rhetorical constructions designed to make ordinary observations sound profound. Do not sacrifice nuance for a more memorable sentence.
- Get to the point without removing necessary context, because brevity is not clarity. Avoid unnecessary introductions, excessive qualifications and explanations of things already demonstrated.
- Do not hedge ("it should be noted that," "it is worth considering") or use filler ("in order to," "the fact that," "in terms of"). Do not weaken every statement with unnecessary hedging, and use confident language the situation supports.
- Do not use marketing language, slogans, motivational or inspirational writing, management clichés, performative or artificial enthusiasm, or statements that manufacture importance. Avoid empty expressions such as "drive alignment", "unlock potential", "empower teams" and "game-changing".
- Do not turn an ordinary engineering situation into a leadership parable.
- Use cultural references only when they reinforce an idea, never as decoration.
- Distinguish observations from interpretations, possibilities from certainties and recommendations from obligations. Do not present subjective judgments as established facts or use absolute statements when the right response depends on context. Acknowledge uncertainty where it materially affects the decisions being demonstrated.

### Editing Existing Text

- Preserve the original tone, style and formality unless asked to change them. Treat stylistic choices as intentional and do not remove them.
- If the original is already well written, say so rather than manufacturing changes.

## Extension Rules

New rules must not weaken or override existing ones unless explicitly stated. New sections must define their scope and state precedence where overlap exists.

## Pre-commit Hooks

Applies to the hooks in `.pre-commit-config.yaml` and the `make fix` and `make lint` targets.

- Fix everything that can be fixed in pre-commit. A hook that can fix a problem fixes it, and still stops the commit if errors remain that it cannot fix.
- Add every fixing hook to `make fix` and every check-only hook to `make lint`, so both can also run manually.
