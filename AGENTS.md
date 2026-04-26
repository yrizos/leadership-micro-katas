# AGENTS.md

## Applicability

This file defines mandatory operational rules for AI coding agents, including Claude Code, Copilot, Cursor, Codex, and similar tools.

Human contributors should use `CONTRIBUTING.md`. Agents must treat this file as enforced constraints, not optional style guidance.

## Boundaries

### Always

- Read the target file before editing it.
- Read `README.md` at the start of any repository task if it exists.
- Check environment state before acting on assumptions about branch, working directory, runtime, or generated files.
- Do only what was explicitly asked.
- Use the smallest diff that satisfies the request.
- When confidence is below 95%, ask instead of proceeding.

### Ask First

- Multi-step or multi-file changes require a confirmed plan before execution.
- Changes to headings, titles, or structure the user wrote require confirmation.
- Any action that deletes or overwrites content the user did not name requires confirmation.
- README updates triggered by other changes require confirmation.
- Git operations that rewrite history or carry unusual risk require confirmation.

### Never

- Do not rename, remove, or rewrite content outside the stated scope.
- Do not run destructive or irreversible commands without the user naming the exact target and confirming.
- Do not present guesses as facts. Say "I am not sure" when uncertain.
- Do not expand scope beyond what was asked. If something else needs attention, mention it and wait.
- Do not interpret questions, complaints, or frustration as implicit requests to take action.

## Preserve User Decisions

If the user chose a specific approach, library, pattern, or naming convention, do not replace it with an alternative unless asked. User decisions are intentional.

Violation: the user names a variable `cfg`, and the agent renames it to `config` because it considers the abbreviation unclear.

## Repository Awareness

When a change affects something documented in the README, flag it and propose the update as a separate step unless the user already included README updates in scope.

Violation: a structural change adds a new directory, but the agent does not flag that the README's structure section is now out of date.

## Git Safety

Agents must never perform destructive Git operations without explicit user confirmation.

Destructive operations include force pushing, deleting branches that are not the agent's own, resetting commits on shared branches, rewriting history already pushed to a remote, `git restore`, `git checkout -- <path>`, `git reset --hard`, and `git clean`.

Before any destructive operation, stop and ask for confirmation. Describe exactly what the operation will do and what data could be lost.

The following Git operations also require confirmation before execution:

- Amending the most recent commit
- Squashing commits on an unshared branch
- Force pushing to a personal branch
- Running an interactive rebase on a local branch

## Git Workflow

Use the branch and commit conventions in `CONTRIBUTING.md` for any branch or commit work.

Before writing a commit message, inspect the staged diff. The message must describe the change that is actually staged, not the agent's memory of the work.

Each commit must represent 1 logical change. Do not combine unrelated changes, mix refactors with behavior changes, or batch independent fixes.

Do not commit unless the user explicitly asks for a commit.

## Writing Audience

The default audience is technically literate professionals. Assume expertise. Do not explain concepts the audience already knows.

If the user specifies a different audience, adapt accordingly. This default applies when no audience is stated.

## Writing Mechanics

- Prefer US English spelling, but avoid US idioms.
- Do not use em dashes.
- Do not use ellipses.
- Avoid parentheses unless removing them changes the meaning.
- Use digits for numbers, except use "a" or "an" when functioning as an indefinite article.
- Use straight quotes only.
- Use articles where grammar requires them.
- Use parallel structure in lists and series outside `katas/`.

## Writing Structure

Lead with the most important point. A reader who stops after the first paragraph should still take away the core message.

Use headings to create scannable structure in anything longer than a few paragraphs. Headings must describe the section, not label it generically.

Do not rename a heading the user wrote unless the user explicitly asked for a rename. APA title case corrections are allowed.

Do not use horizontal rules as section separators.

## Sentences and Paragraphs

Vary sentence length deliberately. Use short sentences for emphasis and longer sentences when layering detail or connecting related ideas.

Do not chain short declarative statements together. When ideas are related, combine them into compound sentences that make the relationship explicit.

Keep paragraphs short. Each paragraph must make a single point. If a paragraph covers 2 ideas, split it.

Every paragraph must connect to the one before it. Avoid generic connective phrases such as "Furthermore," "Additionally," and "Moreover."

## Formatting

Use bold sparingly and only when a term or phrase must stand out on a skim. Do not bold entire sentences outside `katas/`.

Titles and headings must follow APA title case. Capitalize the first word, the last word, and all major words. Do not capitalize minor words unless they are the first or last word.

Use bullet points only for sets of independent, parallel items. Do not convert explanatory or sequential prose into bullet lists.

Inline code formatting is for identifiers, commands, file paths, and literal values. Do not use backticks for emphasis or ordinary words.

Code fences must specify a language when the content is code. Use plain fences for ASCII trees, directory structures, and other non-code structured text.

## Tone

Be direct, reflective, and analytical. Show curiosity and critical reasoning rather than authority for its own sake.

Direct does not mean clipped or stripped of personality. Warmth, nuance, and conversational touches are welcome when they are natural.

Do not hedge with phrases like "it should be noted that," "it is important to mention," or "it is worth considering." State the point.

Do not use filler such as "in order to," "at the end of the day," "as a matter of fact," "the fact that," or "in terms of."

Do not use slogans, performative enthusiasm, or motivational language.

Cultural references are welcome when they reinforce an idea naturally. They must never feel decorative or forced.

## Repetition

Repetition of concepts, words, or phrases is prohibited unless deliberate for rhetorical effect. This applies at the sentence, paragraph, and section level.

If a word appears more than twice in a short passage without rhetorical purpose, find a different construction.

## Preservation and Edit Scope

When rewriting or refining the user's text, preserve the original tone, style, and information. Do not make the text more formal, more casual, or more concise than the original unless explicitly asked.

Do not remove sentiment, softening language, or conversational touches that the user included deliberately. If something looks like a stylistic choice, treat it as one.

If the original text is already well written, say so. Do not manufacture changes.

When asked to fix a phrase, change only that phrase. Do not rewrite surrounding sentences, paragraphs, or sections.

Do not add sentences, sections, or paragraphs the user did not ask for. Scope creep in prose is the same violation as scope creep in code.

## Accuracy

Every claim must be supportable. Do not state something as fact unless it is established knowledge or explicitly sourced. When uncertain, say so.

Do not invent citations, statistics, quotes, or attributions. If the agent cannot verify a claim, omit it or flag it as unverified for the user to confirm.

## Kata Exceptions

Files in `katas/` are exempt from the following writing rules:

- Bold full sentences are allowed.
- Numbers may be written as words.
- Parallel structure in bullet lists is not required.

## Extension Rules

Adding new agent rules must not weaken or override existing rules unless explicitly stated.

Future agent rule sections must define their own scope explicitly, avoid implicitly overriding existing rules, and state precedence if overlap exists.
