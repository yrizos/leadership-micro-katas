# Contributing

This is a small, curated catalog. New katas, sharper versions of existing ones, fixes to documentation, tooling, links, or metadata are all welcome.

Reading [rationale](docs/rationale.md) first is the best place to start. The thinking behind the format shapes most of what makes a kata fit here, and it answers a lot of later questions in advance.

If this is your first time contributing to an open source project, opening an issue or a draft pull request to ask a question is fine.

## Before You Open a Pull Request

Most contributions begin with a GitHub issue. New katas, substantial rewrites, changes to the rationale, and structural changes are best discussed there first, so the catalog stays coherent and you do not put work into something that will not land. Smaller things, like typos, broken links, metadata fixes, and formatting, can go straight to a pull request.

The project uses the standard GitHub fork and pull request workflow. If that is unfamiliar, GitHub's [Contributing to a project](https://docs.github.com/en/get-started/exploring-projects-on-github/contributing-to-a-project) guide covers it. Maintainers may create branches in the main repository, but their changes still go through pull request review.

## What Fits in the Catalog

Contributions should improve the usefulness, clarity, or consistency of the catalog. What counts as a good fit follows from [Rationale](docs/rationale.md), which is the other reason to read it early.

The kinds of contributions that tend to fit:

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

The filename uses a 3-digit prefix and a lowercase hyphenated title, for example `010-escalation-threshold.md`. The number in the frontmatter must match the prefix, and the behavior should name the practiced capability rather than the topic area.

## Branches

Branch names follow [Conventional Branch](https://conventional-branch.github.io/), in the form `<type>/<short-description>`, with lowercase words separated by hyphens. Underscores, dots, nested paths, and bare issue numbers as the whole description are not used.

The supported types are `feature`, `fix`, `hotfix`, `refactor`, `chore`, `docs`, `test`, and `release`.

A few examples:

```text
docs/add-escalation-kata
fix/readme-kata-link
chore/update-hooks
```

The optional pre-commit hook enforces this format on topic branches.

## Commit Messages

Commits follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/), in the form `<type>: <subject>`. The supported types are `feat`, `fix`, `refactor`, `perf`, `test`, `docs`, `build`, `ci`, and `chore`.

A few rules keep the history readable. The subject stays at 72 characters or fewer and uses the imperative mood. The subject does not end with a period, and vague subjects like `docs: update` or `fix: cleanup` are best avoided.

For example:

```text
docs: add escalation threshold kata
```

The optional commit message hook enforces the subject format.

## Local Checks

A small Makefile covers everything useful to run before opening a pull request.

After editing kata files, validate the frontmatter contract:

```sh
make check
```

After adding, removing, renaming, retitling, or changing the behavior frontmatter of a kata, regenerate the README table:

```sh
make readme
```

The branch, commit message, and kata checks can also run automatically on every commit. The hooks need to be installed once:

```sh
make install-hooks
```
