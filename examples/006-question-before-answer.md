---
kata: 006-question-before-answer
description: A newer engineer asks for help with a database migration that blocks writes on a large table.
---

# An Index Migration That Blocks Enrollments

Charlie's migration added an index on the `course_id` column of the `enrollments` table. The enrollments table was one of the largest in the database. On staging, which held a copy of production's data, the migration ran for 4 minutes.

Charlie had been on the team for 3 months, and migrations on large tables were new territory. The message to Bob came with a screenshot of the migration log:

> My index migration makes new enrollments hang on staging for 4 minutes while reads keep working. Any idea what's going on?

Bob had hit the same problem 2 years earlier. In Postgres, a plain `CREATE INDEX` blocks writes to the table until the index is built. Building it with the `CONCURRENTLY` option lets writes continue, though it can't run inside a transaction.

Bob was between 2 reviews and wanted to unblock Charlie quickly. Bob typed the reply right away:

> Plain `CREATE INDEX` locks the table against writes until it finishes. Use `CREATE INDEX CONCURRENTLY` and turn off the transaction for that migration. Should be fine after that.

Charlie changed the 2 lines and reran the migration on staging. New enrollments went through while the index built. Charlie moved on to the next ticket that afternoon.

## A Second Look

Charlie's message described the symptom precisely, with writes blocked and reads working. Bob's reply went straight from that symptom to the fix. Before typing it, Bob could have sent one question instead:

> What is the enrollment insert waiting on while the migration runs?

Finding the lock on the table would take Charlie a few minutes with the database's lock view. If Charlie came back stuck, the fix with `CONCURRENTLY` was still one message away.
