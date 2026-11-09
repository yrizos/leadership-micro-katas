---
kata: 008-thing-you-did-not-say
description: A sprint retro where one engineer knows which test causes most of the failed builds.
---

# The Rerun Count After a Retro

The sprint retro ran its usual 45 minutes. Sticky notes under "What slowed us down" mentioned a late design change, a vague ticket, and slow CI. Erin grouped them on the board and asked for actions.

Bob had looked at the CI history that morning. Of the 23 failed pipeline runs that sprint, 17 had failed in the same end-to-end test and passed on a rerun.

Alice had written that test during the quiz player rewrite. It covered the whole flow from logging in to taking and submitting a quiz. Alice had mentioned more than once how long it took to get right.

"Anything else on CI before we move on?" Erin asked. "We're nearly out of time."

Bob thought about the 17 reruns. "Slow CI" was already on the board, which seemed close enough. The retro moved on to action items and ended on time.

## A Second Look

People were already leaving the room when the retro ended. Bob was the only one who had counted the reruns. Before the next meeting, Bob could have written 2 lines in a private note:

> Noticed: 17 of the 23 failed pipeline runs this sprint failed in Alice's quiz test and passed on a rerun.
>
> Didn't say it because: Alice wrote that test and was sitting across from me. Naming it in front of everyone felt like blaming Alice.
