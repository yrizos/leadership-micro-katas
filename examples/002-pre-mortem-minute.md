---
kata: 002-pre-mortem-minute
description: A backend change that moves a slow email call out of an enrollment request and onto a job queue.
---

# Enrollment Emails on the Job Queue

When a portal admin enrolled a learner in a course, the enrollment endpoint sent the learner an email before it returned a response. Whenever the email provider was slow, portal admins stared at a loader for several seconds. Mallory had picked up the ticket to take the email out of the request.

The nightly reports already used a job queue that ran on its own server, apart from the main database. Its worker picked up new jobs as soon as they arrived.

Mallory's change replaced the email call in the enrollment handler with a `send_enrollment_email` job that carried the new enrollment's ID. The worker would load the enrollment and send the email from there. Mallory sized the ticket `small` and had the code working locally by the afternoon.

The enrollment handler created the enrollment, a progress record for each unit, and the due date reminder inside a single database transaction. Mallory's new job call took the old email call's place near the end of it.

Mallory wanted a second opinion before asking for a review. Bob had set up that queue the year before. The message in the team channel was short:

> Moving enrollment emails onto the job queue, same as the nightly reports. Should be up for review today.

"Makes sense," Bob wrote back within a minute. "That's what the queue is for."

Bob's reply settled the approach for Mallory. The pull request description took a few minutes to write. Mallory assigned Bob as the reviewer before the end of the day.

## A Second Look

Mallory's message proposed the queue, and Bob agreed before anyone had asked what happens to a job queued inside a transaction. Opening the pull request would lock in the approach. Before then, Mallory could have written a private note:

> This has failed in production. Why?
>
> 1. The worker picks up the job before the enrollment transaction commits. It can't find the new enrollment and fails. Depending on how the queue retries, the email goes out late or not at all.
> 2. The worker goes down for a few hours, and nobody notices that enrollment emails stopped until learners complain.
> 3. The email provider times out after it has already sent the email. The job retries, and the learner gets the email twice.
>
> The first one looks the most likely because the worker picks up jobs right away. The plan doesn't cover it yet. The new job is queued where the email call used to be, inside the enrollment transaction.

Only the open question needed to leave the note. Mallory could have asked it in the same thread:

> @Bob, have we queued a job from inside a transaction anywhere else? I'd like to know before the pull request goes up.
