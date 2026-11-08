# Contributing

The best contribution is to [pick a kata](README.md#katas) and try it out. A week of practice shows where a kata could be clearer and which moments the catalog does not cover yet.

When you want to turn what you noticed into a change, contributions of every size are welcome. The catalog is small and curated. Most of what makes a kata fit follows from the [thinking behind the format](docs/rationale.md), so reading it first saves time.

If this is your first open source contribution, an issue or a draft pull request is a fine place to ask a question.

## Before You Open a Pull Request

New katas, substantial rewrites, changes to the rationale, and structural changes start as a GitHub issue. Talking first keeps the catalog coherent and saves you from putting work into something that will not land. Typos, broken links, metadata fixes, and formatting can go straight to a pull request.

Contributions use the standard GitHub fork and pull request workflow, and GitHub's guide to [contributing to a project](https://docs.github.com/en/get-started/exploring-projects-on-github/contributing-to-a-project) covers it if it is new to you. Maintainers may create branches in the main repository, but their changes still go through pull request review.

## What Fits in the Catalog

A good contribution makes the catalog more useful, clearer, or more consistent:

- New katas for engineers preparing for a lead role
- Clearer versions of existing katas that keep the same behavior
- Fixes to examples and documentation

General leadership advice does not fit, however well written, because it gives the reader nothing to do when the moment arrives. The catalog is about prepared responses to specific moments, not leadership in the abstract.

## Proposing a New Kata

Every kata started as a habit. The next one could be yours.

A proposal starts as an issue that covers the trigger moment, the behavior the kata practices, the proposed steps, the closing principle, and why the kata belongs alongside the others. The maintainer may suggest changes before the pull request, to keep the catalog coherent and avoid near-duplicates.

## Writing a Kata

Each kata teaches one leadership micro-habit, attached to a real moment the reader already meets in their week. It is not an essay, a checklist, or a lesson plan. It is a trigger, a short practice, and a principle the reader carries into the next time the moment shows up.

Triggers work best when they name something that actually happens, like a ticket landing for refinement, a teammate bringing a problem, or being about to ship code that is not quite right. Prompts like "communicate better," "be more strategic," or "think like a leader" give the reader nothing to do.

The practice should leave something on the page, usually a sentence, a list, a condition, a question, or a short note. Steps get there when they are short and observable, with verbs like write, list, flag, name, ask, check, or remove rather than verbs that describe a mental state.

The closing principle compresses the lesson into a single sentence, ideally one that names a cost, a tension, a default behavior, or a decision rule.

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

The filename starts with a 3-digit prefix followed by a lowercase hyphenated title, such as `010-escalation-threshold.md`. The `number` in the frontmatter has to match that prefix, and each kata needs its own number. The `behavior` field names the capability being practiced rather than the topic area. Each file also needs exactly 1 H1 for the title and exactly 1 bold line for the closing principle.

## Branches

Branch names follow [Conventional Branch](https://conventional-branch.github.io/) in the form `<type>/<short-description>`, where the type is one of `feature`, `feat`, `fix`, `hotfix`, `refactor`, `chore`, `docs`, or `test`.

The description uses lowercase words separated by hyphens, with no underscores, dots, or nested paths, and a bare issue number is not enough on its own.

A few examples:

```text
docs/add-escalation-kata
fix/readme-kata-link
chore/update-hooks
```

## Commit Messages

Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) in the form `<type>: <subject>` or `<type>(<scope>): <subject>`, where the type is one of `feat`, `fix`, `refactor`, `perf`, `test`, `docs`, `build`, `ci`, or `chore`.

The scope is optional and names the part of the repository the commit touches. Some common ones are:

- `katas` for kata files in `katas/`
- `examples` for kata examples in `examples/`
- `agents` for `AGENTS.md` and `.claude/`
- `hooks` for `.pre-commit-config.yaml`, `.gitlint`, and hook scripts
- `make` for the `Makefile` and the scripts it runs
- `site` for the website in `site/`

The subject stays at 72 characters or fewer, uses the imperative mood, and has no trailing period. It also has to say what changed, because the `commit-msg` hook described in [Local Checks](#local-checks) rejects vague subjects like `docs: update` or `fix: cleanup`.

For example:

```text
docs: add escalation threshold kata
```

## Local Checks

Everything worth running before a pull request lives in the Makefile, and `make help` lists the targets. Install [pre-commit](https://pre-commit.com) first, because `make fix` and `make lint` run their checks through it.

- `make check` confirms that each kata's `number` matches its filename prefix and is unique, that `behavior` is filled in, and that the file has exactly 1 H1 and exactly 1 bold closing principle.
- `make readme` regenerates the README kata table. Run it after adding, removing, renaming, or retitling a kata, or after changing its `behavior`.
- `make fix` cleans up trailing whitespace and mixed line endings and regenerates the README kata table.
- `make lint` checks for merge conflict markers, invalid YAML, Makefile problems with [checkmake](https://github.com/mrtazz/checkmake), and shell script problems with ShellCheck, then runs `make check`.

Running these by hand is optional, because pre-commit can run the same checks on every commit. `make hooks-install` sets up 2 hook stages:

- `pre-commit` checks the branch name, validates the katas when kata files are staged, and runs the fix and lint hooks behind `make fix` and `make lint`.
- `commit-msg` checks the commit message with [gitlint](https://jorisroovers.com/gitlint/), configured in `.gitlint`.

`make hooks-uninstall` removes them again.
