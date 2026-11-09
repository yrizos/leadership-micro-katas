---
title: About
layout: page
---

# About

These katas are short exercises for the moments of tech leadership that keep showing up. They started as habits [Yannis Rizos](https://yrizos.com) picked up over 20 years of engineering work.

Training the next group of tech leads at [Epignosis](https://www.epignosishq.com/) gave a reason to write them down. Each habit became a kata short enough to practice in the middle of a working day.

20 years of habits, written down for the next lead.

## A Habit That Took Years

About 20 years ago, as a young developer, I broke production. The rollback was slow, and for a few hours I was sure the company would close because of me. Looking back, the impact was barely worth mentioning. At the time, I was devastated.

A few days later, the team went out for drinks, and someone gave me advice I have used ever since: "Anticipate failure. Write down what might go wrong. Then, hope you never have to think about it again." I no longer remember who said it.

It took a few more incidents and near misses before the advice stuck. I started listing what could go wrong before any change I cared about, and sometimes the list changed the plan. I cannot point to the moment it became a habit.

That list eventually became a kata called the [Pre-Mortem Minute]({{< relref "/katas/002-pre-mortem-minute" >}}). Before you commit to a technical approach, you write "This has failed in production. Why?", list 3 specific reasons, and check whether your plan addresses the most plausible one.

Years later, I [replayed that first incident](https://yrizos.com/writing/leadership-micro-katas/) with the kata in mind. The most plausible risk was a schema migration that ran on deploy with no tested way to reverse it. Running it on its own before the code change would have removed that risk.

I cannot be sure I would have caught it. I only know I never gave myself the chance.

## Why I Wrote Them Down

Habits like that one matter most after the move into a lead role, because that is when the feedback that rewarded earlier habits goes quiet. Advice gets vaguer at the same time. A goal like "communicate more clearly" gives you nothing to do at 11:42 on a Tuesday.

Nothing pushed me to put my habits on paper until March 2026, when we started [training the next group of tech leads](https://blog.talentlms.io/posts/the-job-before-the-job/) at [Epignosis](https://www.epignosishq.com/). They had to become something I could hand over, so I extracted the katas from my internal presentation and published them in the open. Anyone can clone, fork, or argue with them.

## Where to Start

Each kata takes 10 to 15 minutes and needs no team, coach, or permission. You do not need to be a tech lead yet to practice one.

Stay with one kata for a week. Keep a short note as you go, with 3 questions:

- Did the moment arise?
- What did I do?
- What would I change?

If the moment never came up, that is also worth knowing.

I make no promises about results. I have seen these katas work, sometimes for me and sometimes for people I passed them to over the years. I have also seen versions that worked for me fail to land for someone else, and I have abandoned some myself.

## Contributing

The best contribution is to [pick a kata]({{< relref "/#katas" >}}) and try it out. A week of practice shows where a kata could be clearer and which moments the catalog does not cover yet.

When you want to turn what you noticed into a change, the katas live in a [public GitHub repository](https://github.com/yrizos/leadership-micro-katas), and contributions of every size are welcome:

- New katas for engineers preparing for a lead role
- Clearer versions of existing katas that keep the same behavior
- Fixes to examples and documentation

Every kata started as a habit. The next one could be yours.
