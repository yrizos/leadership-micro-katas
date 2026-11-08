# Contributing

This is a small, curated catalog. New katas, sharper versions of existing ones, and fixes to documentation, tooling, links, or metadata are all welcome.

Reading [Rationale](docs/rationale.md) first will save you time. Most of what makes a kata fit here follows from the thinking behind the format, so it answers a lot of later questions in advance.

If this is your first time contributing to an open source project, opening an issue or a draft pull request to ask a question is fine.

## Before You Open a Pull Request

Most contributions begin with a GitHub issue. New katas, substantial rewrites, changes to the rationale, and structural changes are best discussed there first, so the catalog stays coherent and you do not put work into something that will not land. Smaller things, like typos, broken links, metadata fixes, and formatting, can go straight to a pull request.

The project uses the standard GitHub fork and pull request workflow. If that is unfamiliar, GitHub's [Contributing to a project](https://docs.github.com/en/get-started/exploring-projects-on-github/contributing-to-a-project) guide covers it. Maintainers may create branches in the main repository, but their changes still go through pull request review.

## What Fits in the Catalog

A good contribution makes the catalog more useful, clearer, or more consistent. These are the kinds that tend to fit:

- New katas for software engineers preparing for a lead role.
- Clarifications to existing katas, where the underlying behavior is preserved.
- Corrections to rationale, references, links, or repository documentation.
- Tooling changes that support kata validation or contribution quality.

General leadership advice, motivational language, or broad opinion without a concrete practice is not a good fit, even when well written. The catalog is about prepared responses to specific moments, not leadership in the abstract.

## Proposing a New Kata

A new kata starts as an issue. The proposal should cover the trigger moment, the behavior the kata practices, the proposed steps, the closing principle, and a short note on why this kata belongs alongside the others. The maintainer may suggest changes before the pull request, to keep the catalog coherent and avoid near-duplicates.

## Writing a Kata

Each kata teaches a single leadership micro-habit, attached to a real moment the reader already encounters in their week. A kata is not an essay, a checklist, or a lesson plan. It is a small trigger, a short practice, and a principle the reader can carry into the next time the moment shows up.

The practice should produce something visible. In this repository that usually means the reader writes a sentence, a list, a condition, a question, or a short note.

Triggers work best when they name a real moment, like a ticket landing for refinement, a teammate bringing a problem, or being about to ship code that is not quite right. Broader prompts, like "communicate better," "be more strategic," or "think like a leader," do not give the reader anything to do.

Steps work best when they are short, executable, and observable. Verbs that produce something on the page, like write, list, flag, name, ask, check, or remove, work better than verbs that describe a mental state.

The closing principle should compress the lesson into a single sentence, ideally one that names a cost, a tension, a default behavior, or a decision rule.

A kata file looks like this:

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

The filename starts with a 3-digit prefix followed by a lowercase hyphenated title, for example `010-escalation-threshold.md`. The `number` in the frontmatter has to match that prefix, and each kata needs its own number. Fill in `behavior` with the capability being practiced rather than the topic area. Each file also needs exactly 1 H1 for the title and exactly 1 bold line for the closing principle.

## Branches

Branch names follow [Conventional Branch](https://conventional-branch.github.io/), in the form `<type>/<short-description>`, with lowercase words separated by hyphens. Avoid underscores, dots, and nested paths, and do not use a bare issue number as the whole description. Release branches work a little differently, because their description is a version number such as `2.4.0` or `2.4.0-rc1`.

The supported types are `feature`, `feat`, `fix`, `hotfix`, `refactor`, `chore`, `docs`, `test`, and `release`.

A few examples:

```text
docs/add-escalation-kata
fix/readme-kata-link
chore/update-hooks
release/2.4.0
```

## Commit Messages

Commits follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/), in the form `<type>: <subject>` or `<type>(<scope>): <subject>`. The supported types are `feat`, `fix`, `refactor`, `perf`, `test`, `docs`, `build`, `ci`, and `chore`.

The scope is optional. Some common scopes are:

- `katas` for kata files in `katas/`
- `examples` for kata examples in `examples/`
- `agents` for `AGENTS.md` and `.claude/`
- `hooks` for `.pre-commit-config.yaml`, `.gitlint`, and hook scripts
- `make` for the `Makefile` and the scripts it runs

Keep the subject to 72 characters or fewer, write it in the imperative mood, and leave off the trailing period. The `commit-msg` hook described in [Local Checks](#local-checks) rejects vague subjects like `docs: update` or `fix: cleanup`.

For example:

```text
docs: add escalation threshold kata
```

## Local Checks

Everything worth running before a pull request is in the Makefile, and `make help` lists the targets. `make fix` and `make lint` run their checks through [pre-commit](https://pre-commit.com), so install it first.

- `make check` checks that each kata's `number` matches its filename prefix and is unique, that `behavior` is filled in, and that the file has exactly 1 H1 and exactly 1 bold closing principle.
- `make readme` regenerates the README kata table. Run it after adding, removing, renaming, or retitling a kata, or after changing its `behavior`.
- `make fix` fixes trailing whitespace and mixed line endings, and regenerates the README kata table.
- `make lint` checks for merge conflict markers, invalid YAML, Makefile problems with [checkmake](https://github.com/mrtazz/checkmake), and shell script problems with ShellCheck, then runs `make check`.

If you would rather not run these by hand, pre-commit can also run the same checks on every commit. `make hooks-install` sets up 2 hook stages:

- `pre-commit`: checks the branch name, validates the katas when kata files are staged, and runs the fix and lint hooks behind `make fix` and `make lint`.
- `commit-msg`: checks the commit message with [gitlint](https://jorisroovers.com/gitlint/), configured in `.gitlint`.

`make hooks-uninstall` removes them again.
