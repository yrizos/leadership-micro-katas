# AGENTS.md

## Applicability

Mandatory rules for AI coding agents (Claude Code, Copilot, Cursor, Codex, and similar tools). Human contributors use `CONTRIBUTING.md`.

## Boundaries

### Always

- Read the target file before editing it.
- Read `README.md` at the start of any repository task.
- Verify branch, directory, and runtime state before acting on assumptions.
- Do only what was explicitly asked.
- Use the smallest diff that satisfies the request.
- When confidence is below 95%, ask instead of proceeding.

### Ask First

- Multi-step or multi-file changes require a confirmed plan before execution.
- Changes to headings, titles, or structure the user wrote require confirmation.
- Deleting or overwriting content the user did not name requires confirmation.
- README content updates triggered by other changes require confirmation. Regenerating the kata table with `make readme` after kata metadata changes does not.
- Git operations that rewrite history or carry unusual risk require confirmation.

### Never

- Do not rename, remove, or rewrite content outside the stated scope.
- Do not run destructive commands unless the user names the exact target and confirms.
- Do not present guesses as facts; flag uncertainty instead.
- Do not expand scope; if something else needs attention, mention it and wait.
- Do not interpret questions, complaints, or frustration as implicit requests to take action.

## Accuracy

Only state what is established knowledge or explicitly sourced; flag uncertainty rather than asserting. Do not invent citations, statistics, quotes, or attributions; omit or flag anything that cannot be verified.

## Preserve User Decisions

Do not replace the user's chosen approach, pattern, or phrasing with an alternative unless asked.

Violation: the user writes a kata trigger in an informal register. The agent rewrites it in formal prose because it considers the original unclear, without being asked.

## Repository Awareness

When a change affects something documented in the README, flag it and propose the update as a separate step unless the user already included README updates in scope.

Violation: a kata is renamed or its behavior frontmatter changes, but the agent does not flag that the README kata table needs to be regenerated with `make readme`.

## Git Safety

Never perform destructive Git operations without explicit confirmation. Destructive operations: force pushing, deleting branches not owned by the agent, resetting or rewriting pushed commits, `git restore`, `git checkout -- <path>`, `git reset --hard`, `git clean`.

These also require confirmation: amending the last commit, squashing on an unshared branch, force pushing to a personal branch, interactive rebase on a local branch.

## Git Workflow

- Use the branch and commit conventions in `CONTRIBUTING.md`.
- Inspect the staged diff before writing the commit message; it must describe what is staged, not the agent's memory of the work.
- Each commit represents 1 logical change; do not combine unrelated changes, mix refactors with behavior changes, or batch independent fixes.
- Do not commit unless the user explicitly asks.

## Writing Audience

Default audience: technically literate professionals. Assume expertise and do not explain known concepts. Adapt if the user specifies otherwise.

## Writing Mechanics

- Prefer US English spelling, but avoid US idioms.
- Do not use em dashes.
- Do not use ellipses.
- Avoid parentheses unless removing them changes the meaning.
- Use digits for numbers outside `katas/`, except write "a" or "an" rather than "1" for a single unspecified instance (for example, "write a sentence," not "write 1 sentence").
- Use straight quotes only.
- Use articles where grammar requires them.
- Use parallel structure in lists and series outside `katas/`.

## Writing Structure

- Lead with the most important point.
- Use descriptive headings for anything longer than a few paragraphs; do not label sections generically.
- Do not rename a heading the user wrote; APA title case corrections are allowed.
- Do not use horizontal rules as section separators.

## Sentences and Paragraphs

- Vary sentence length; use short sentences for emphasis, longer ones when layering related ideas.
- Do not chain short declarative statements; combine related ideas into compound sentences.
- One point per paragraph; split if it covers 2 ideas.
- Every paragraph must connect to the one before it; avoid "Furthermore," "Additionally," "Moreover."

## Formatting

- Bold sparingly; do not bold entire sentences outside `katas/`.
- Headings and titles use APA title case.
- Bullet points only for independent, parallel items; not for explanatory or sequential prose.
- Backticks for identifiers, commands, file paths, and literal values only.
- Code fences specify a language; use plain fences for non-code structured text.

## Tone

- Be direct, reflective, and analytical; warmth and conversational touches are welcome when natural.
- Do not hedge ("it should be noted that," "it is worth considering") or use filler ("in order to," "the fact that," "in terms of").
- Do not use slogans, performative enthusiasm, or motivational language.
- Cultural references are welcome when they reinforce an idea; never decorative.

## Repetition

Avoid repeating concepts, words, or phrases across sentences, paragraphs, and sections unless deliberate for rhetorical effect. If a word appears more than twice without purpose, rewrite.

## Preservation and Edit Scope

- Preserve the original tone, style, and formality unless explicitly asked to change them.
- Treat stylistic choices as intentional; do not remove them.
- If the original is already well written, say so rather than manufacturing changes.
- Change only what was asked; do not rewrite surrounding content.
- Do not add content the user did not ask for.

## Extension Rules

New rules must not weaken or override existing ones unless explicitly stated. New sections must define their scope and state precedence where overlap exists.
