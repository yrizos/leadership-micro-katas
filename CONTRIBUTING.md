# Contributing

Thanks for considering a contribution. This is a small, curated catalog, and a single thoughtful change can make it noticeably better. Typo fixes, sharpened katas, and new kata proposals are all welcome.

If you are new to open source, open an issue or a draft pull request and ask any question you have. You do not need to get it right on the first try.

## Contribution Model

All repository changes go through a pull request.

Open a GitHub issue first for new kata ideas, substantial rewrites, rationale changes, and structural changes. Small fixes can go straight to a pull request: typo corrections, broken links, metadata fixes, formatting corrections.

This project uses the standard GitHub fork and pull request workflow. If you have not done it before, GitHub's [Contributing to a project](https://docs.github.com/en/get-started/exploring-projects-on-github/contributing-to-a-project) guide walks through every step. Maintainers may create branches in the main repository, but their changes still go through pull request review.

## What Belongs Here

Contributions should improve the usefulness, clarity, or consistency of the kata catalog.

Good contributions include:

- New leadership katas for software engineers preparing for lead roles
- Clarifications to existing katas that preserve their behavior
- Corrections to rationale, references, links, or repository documentation
- Tooling changes that support kata validation or contribution quality

Please skip contributions that only add general leadership advice, motivational language, or broad opinion without a concrete practice.

## New Kata Proposals

Open an issue before adding a new kata. Include:

- The trigger moment
- The behavior the kata practices
- The proposed steps
- The closing principle
- Why the kata belongs in this catalog

The maintainer may ask for changes before a pull request. This keeps the catalog coherent and avoids duplicate katas.

## Kata Format

Every kata file should use this structure:

```markdown
---
number: 10
behavior: Name the observable behavior
---

# The Kata Title

Name the trigger moment.

- Give the first action
- Give the second action
- Give the third action when needed

**State the principle the reader should remember.**
```

The filename should use a 3-digit prefix and a lowercase hyphenated title, for example `010-escalation-threshold.md`.

The frontmatter number must match the filename prefix. The behavior should name the practiced capability, not the topic area.

## Kata Style

Each kata teaches a single leadership micro-habit. It should attach the habit to a real work moment the reader already encounters.

A kata is not an essay, checklist, or lesson plan. It is a small behavioral trigger with a short practice and a principle that should stay with the reader.

The practice should produce something visible. In this repo, that usually means the reader writes a sentence, list, condition, question, or brief note.

Good triggers name a moment:

- A ticket lands for refinement.
- A teammate brings you a problem.
- You are about to ship code you know is not right.

Reject broad prompts like:

- Communicate better.
- Be more strategic.
- Think like a leader.

Steps should be short, executable, and observable. Prefer verbs that create output: write, list, flag, name, ask, check, remove.

The closing principle should compress the lesson into a single sentence. It should reveal a cost, tension, default behavior, or decision rule.

## Branch Names

Branches use [Conventional Branch](https://conventional-branch.github.io/) with the project-specific constraints below.

Use the structure `<type>/<short-description>` with lowercase words separated by hyphens. Do not use underscores, dots, nested paths, or an issue number as the whole description.

Allowed branch types:

- `feature`: new functionality
- `fix`: bug fix
- `hotfix`: urgent production fix
- `refactor`: restructuring without behavior change
- `chore`: maintenance work
- `docs`: documentation changes
- `test`: test additions or corrections
- `release`: release preparation

Examples:

```text
docs/add-escalation-kata
fix/readme-kata-link
chore/update-hooks
```

The optional pre-commit hook enforces this format on topic branches.

## Commit Messages

Commits use [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/) with the project-specific constraints below.

Use the structure `<type>: <subject>`.

Allowed commit types:

- `feat`
- `fix`
- `refactor`
- `perf`
- `test`
- `docs`
- `build`
- `ci`
- `chore`

Rules:

- Keep the subject at 72 characters or fewer.
- Use imperative mood.
- Do not use a scope. Write `docs: ...`, not `docs(readme): ...`.
- Do not end the subject with a period.
- Avoid vague subjects like `docs: update` or `fix: cleanup`.

Example:

```text
docs: add escalation threshold kata
```

The optional commit message hook enforces the subject format.

## Local Checks

The project ships a small Makefile that covers everything you need before opening a pull request.

After changing kata files, validate the frontmatter contract:

```sh
make check
```

After adding, removing, renaming, retitling, or changing the behavior frontmatter for a kata, regenerate the README table:

```sh
make readme
```

To run the branch, commit message, and kata checks automatically on every commit, install the local Git hooks once:

```sh
make install-hooks
```

