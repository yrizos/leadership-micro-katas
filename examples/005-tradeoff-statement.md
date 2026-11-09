---
kata: 005-tradeoff-statement
description: A short decision entry proposing a cache for a slow dashboard query.
---

# Caching Course Progress on the Dashboard

The learner dashboard showed each enrolled course as a card with a completion percentage. For learners enrolled in many courses, the query behind those percentages took about 3 seconds. Grace in support had forwarded 4 customer complaints about the slow page that month.

Alice found that every page load recalculated the percentages from scratch. Clearing stored percentages whenever progress changed would have meant editing the video player, quiz grading, and admin imports, and Alice owned none of those modules. Keeping the percentages for 5 minutes in the cache the app already used for sessions looked like the simplest fix.

Alice had sat in on a few customer calls with Grace earlier that year. Most of the learners on those calls opened the dashboard right after finishing a unit. Watching the percentage go up was how they tracked their progress through a course.

The team recorded decisions like this as short entries in a shared decisions document. Alice wrote the entry on Wednesday morning:

> **Cache Course Progress on the Dashboard for 5 Minutes**
>
> - Repeat visits within 5 minutes load in under 200 ms instead of about 3 seconds for learners enrolled in many courses.
> - The progress query runs at most once every 5 minutes per learner instead of on every page load.
> - No new infrastructure is needed, since the cache is already running.

"Nice," Bob wrote in a comment. "That's a big win for about 20 lines of code."

Nobody else commented by lunch. To Alice, the entry covered what mattered because every reason came with a number. The ticket moved to the sprint board that afternoon.

## A Second Look

Every line in Alice's entry described a gain. Bob's comment answered with another one. Before sharing the entry, Alice could have added one line naming what the cache would give up:

> Cost: a learner who finishes a unit and returns to the dashboard can see the old percentage for up to 5 minutes.

Alice already knew from the customer calls that this was when learners looked at the dashboard most. Whether 5 minutes of an old percentage would bother them was a question Erin was better placed to answer.
