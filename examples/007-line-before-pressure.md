---
kata: 007-line-before-pressure
description: An engineer on the support rotation watches a database disk fill faster than usual.
---

# A Database Disk Filling Up

Mallory had the team's support rotation that week. Checking the infrastructure dashboards each morning was part of it. Most mornings, nothing on them needed attention.

On Wednesday, the main database's disk stood at 78% full. It usually grew by less than a point a week, but for the last 3 days it had grown about 2 points a day.

Heidi on the platform team looked after the database servers. The platform team's alerts fired when a disk passed 90%, because the database needed the remaining space for its own maintenance work. The platform team changed the main database only during a scheduled weekly window, so a resize could take up to a week.

Mallory wasn't sure the growth would last. The course transcripts feature had shipped on Monday with a one-time backfill that stored a text transcript for every existing video in the database.

Asking Heidi felt like raising a false alarm over a number that might level off. Mallory set a reminder to check the disk again on Friday. The support queue had 6 tickets waiting.

## A Second Look

Mallory's choice between asking for help and waiting came down to a feeling about the number. Before setting the reminder, Mallory could have written the condition for escalating in the support notes:

> Escalate to Heidi on the platform team if the database disk will reach 90% before they can finish a resize. Resizes take up to 7 days. The disk is growing about 2 points a day.
>
> Check: 78% today plus 2 points a day reaches 90% in 6 days. That is sooner than 7, so the condition is true.

The backfill could still turn out to be the whole cause. In that case, the growth might slow before the disk got close to 90%. Mallory could mention both possibilities in the message to Heidi.
