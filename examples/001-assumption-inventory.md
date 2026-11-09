---
kata: 001-assumption-inventory
description: A refinement session for a ticket that exports a paginated list as a single file.
---

# CSV Export for the Audit Log

Portal admins used the Audit Log page to see who had changed what in their portal. Several had asked for a way to get those entries into a spreadsheet for their quarterly access reviews.

At Tuesday's refinement, the team sized each ticket for the next sprint as `small`, `medium`, or `large`. Erin put the export ticket on the shared screen:

> Portal admins can export the audit log as a CSV file from the Audit Log page. The export includes everything shown in the log for the selected date range.

"Most admins pick the whole quarter," Erin said. "Some go back a year when an auditor asks for it. Right now they copy every entry by hand."

The endpoint Bob had written for the Audit Log page returned 50 entries per call. Each entry had the 4 fields below.

- an event type, such as `role_changed`
- the ID of the person who made the change
- the IDs of whatever was changed, such as a person and a role
- a timestamp in UTC

"We already have the query," Bob said. "Drop the page limit, write the rows out as CSV, and send them back with a download header. I'd size it `small`."

Alice had added the `role_changed` event in the spring. That work included a frontend template that turned the fields into a line like "Dave changed Frank's role to Admin."

To Alice, Bob's plan sounded like the existing endpoint with a CSV at the end. Alice was already taking the `large` email provider migration that sprint. A familiar `small` ticket beside it looked like a good fit.

When Erin asked for sizes, Alice also voted `small`. The ticket went into the sprint with the rest.

## A Second Look

Bob's `small` estimate came from a query that had never returned more than 50 entries at a time. A minute earlier, Erin had said that admins picked a quarter or even a year.

Before voting, Alice could have posted this comment on the ticket:

> @Bob and @Erin, the plan reuses the Audit Log query without the page limit and returns the selected date range as one CSV in a single request.
>
> 1. The permission checks on the Audit Log page are enough for an export.
> 2. A year of activity for our largest portal fits within the 30-second request timeout.
> 3. Admins can work with event types and IDs. The readable lines on the page are built in the browser.
> 4. UTC timestamps are fine for admins. The page shows times in each viewer's time zone.
> 5. Exports are rare enough not to slow down the main database for everyone else.
>
> Item 2 could change the approach. If a year for our largest portal takes longer than 30 seconds, the request might time out before the file is ready. Does anyone know how many entries that portal logs in a year?
>
> Item 3 could change it too if admins need the readable lines that only the browser builds today.
>
> @Erin, would event types and IDs work for the access reviews?
