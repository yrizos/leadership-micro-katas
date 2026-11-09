---
kata: 009-debt-sentence
description: A beta launch that limits a new page to a few customers with a hard-coded list.
---

# Hard-Coded Beta Access for Reports

The new reports page for portal admins was ready for a beta with 3 customer portals. Erin had picked them from customers who asked for the reports early. Charlie's last ticket was to limit the page to those portals.

The feature flag service could switch a feature on for everyone or for a percentage of users. Targeting specific portals needed a new rule type, which Heidi on the platform team had planned for next month.

Charlie added a constant to `reports/access.py` with the 3 portal IDs. Both the reports page and its API checked the list before returning anything. The change took about an hour.

"Hard-coded IDs?" Bob asked in the review. "Fine for a beta, I guess."

Charlie agreed it was fine for a beta. The pull request description said "Limit reports to beta portals" and nothing more. Charlie merged it on Thursday afternoon.

## A Second Look

Charlie knew the list was the wrong place for access rules. Bob's review had hinted at it in a few words. Before merging, Charlie could have added 2 lines to the pull request description:

> What's wrong: beta access is a hard-coded list of 3 portal IDs in `reports/access.py`. Changing who has access needs a code change and a deploy.
>
> Cost to fix later: about half a day to move both checks to the flag service once portal rules exist next month.

Both lines were easy to write because Charlie had just finished the change and knew what was wrong with it. The half-day estimate was still a guess, since nobody had seen the new rule type yet.
