---
kata: 003-opinion-or-observation
description: A code review of a pull request that calls an internal service without the team's shared HTTP client.
---

# Review of a Search Service Call

Charlie's pull request added search to the course catalog. The backend called the internal search service and returned the top 20 matches. Mallory picked up the review after lunch.

Most of the backend called other services through a shared `HttpClient` class. It set a 5-second timeout, retried once on connection errors, and added the request ID to every log line.

Charlie's new `get_data` function called the search service through the HTTP library directly, with no timeout and no logging around it. Mallory noticed it on the first pass. To Mallory, the call looked like a missed convention more than a design choice.

Mallory had 3 other reviews waiting that afternoon. The 2 comments took less than a minute to type:

- On the HTTP call: "We should use `HttpClient` here instead of calling the library directly."
- On the function name: "I'd prefer a more descriptive name than `get_data`."

Charlie had joined the team 3 months earlier. Charlie usually applied review comments by the next morning without discussing them. The review went in as "changes requested."

## A Second Look

Both comments told Charlie what to change without saying why. Before submitting, Mallory could have rewritten the first one around what the code did:

> This call has no timeout, so if the search service hangs, the catalog request hangs with it. It also writes no log lines, so a failed search won't show up when we trace a request by its ID.
>
> `HttpClient` sets a timeout and logs every call with the request ID. Could you switch to it?

The name was harder to defend. `get_data` lived in `search_client.py` and had a single caller, which left little room for confusion. With no failure, cost, or broken principle to point to, Mallory could have turned the second comment into a question:

> Would `fetch_search_results` be clearer at the call site? I'm fine with `get_data` if you'd rather keep it.
