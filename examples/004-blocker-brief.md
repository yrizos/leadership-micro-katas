---
kata: 004-blocker-brief
description: A product manager asks whether certificates that were already issued can show a course's new name.
---

# Renaming a Course After Certificates Were Issued

Erin was the team's product manager and handled requests from the largest customers. Ivan, who ran IT at a logistics company, had written that their training records would be audited in 3 weeks.

The company's portal admin had renamed the "Forklift Safety" course to "Warehouse Equipment Safety," and the portal showed the new name everywhere within seconds. The rename also appeared in the portal's audit log, like every change an admin made. To Erin, updating the certificates sounded like the same kind of change.

The message to Bob went out on Monday morning:

> Can we update the certificates learners already have so they show the new course name? About 340 people finished it under the old one, and the auditor will compare their certificates against the course list.

Bob had built the certificates the year before. Each one was a PDF created on the day the learner finished the course, with the course name written into the file itself.

Creating fresh PDFs for every past learner would take about 2 days, and nobody had room for that work. Learners who had already downloaded their certificates would keep the old name either way. Certificates issued from now on would show the new name without any changes.

Bob was in the middle of a review and wanted to answer before the standup. The reply went out without a second read:

> Certs are rendered at completion and stored as immutable blobs, so the name is baked in. We'd need a backfill job to regenerate ~340 PDFs, maybe 2 days, and anything already downloaded is stale regardless. New certs already pick up the new name.

Erin understood that the old certificates were a problem. Whether 2 days of work was a lot, or whether the auditor would accept the old name, was still unclear. Ivan was waiting for an answer.

## A Second Look

Bob's reply used words Erin would have to look up, such as "rendered," "blobs," and "backfill job." Before sending, Bob could have written this for Erin instead:

> Certificates that were already issued still show the old course name, and the copies people downloaded will keep it no matter what we do. Each certificate is a file created on the day the learner finished, with the course name printed in it at that moment.
>
> We can create new copies with the new name for all 340 learners, which takes about 2 days and means moving something else out of this sprint, or Ivan can show the auditor the audit log entry for the rename, which costs us nothing if the auditor accepts it.

Whether the auditor would accept the audit log entry was still an open question. It was one Erin could pass on to Ivan, with the cost of the other option next to it.
