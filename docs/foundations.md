# Foundations

Leadership behavior can be trained the same way technical skills can: through structured repetition with feedback. This document collects the research behind that claim and explains why these katas are shaped the way they are.

## Practice Beats Knowledge

Programmers rarely practice. They perform. Every line of code is production work with production consequences. Dave Thomas coined the term Code Kata in 2003 to give programmers something musicians and athletes already had: a small, repeatable exercise with no stakes, designed to build fluency through repetition.

The word _kata_ (Japanese 型 or 形) means a fixed pattern of movements practiced until the response becomes automatic. The movements are not combat. They are rehearsals, stripped of chaos so you can focus on form. Over time, the form becomes available without deliberation.

Mike Rother applied the same idea to management in _Toyota Kata_ (2009). Ted Neward created Architectural Katas for software architecture, later popularized by Neal Ford and Mark Richards. Every adaptation preserved the core mechanism: repeated practice of a specific behavior, under simple enough conditions to allow focused attention, builds durable skill more reliably than instruction alone.

Anders Ericsson spent decades studying expert performance and found that expertise is not a product of talent or years on the job. It is a product of deliberate practice: practice that targets a specific skill, operates at the edge of current ability, provides immediate feedback, and demands full attention. Without all four, repetition produces familiarity but not improvement. Doctors with 20 years of experience do not outperform doctors with 5. Chess players who only play casual games plateau. Time in role is not training. This is why each kata targets a single behavior rather than a cluster of competencies, and why repetition across weeks matters more than coverage in a single session.

## Training Does Not Transfer

People attend workshops, read books, complete courses, and return to their jobs largely unchanged. The research on this gap is extensive and consistent.

A 2025 scoping review by Nimante et al. analyzed 60 synthesis articles on professional development transfer. Drawing on a meta-analysis by Hughes et al. (2020), it reports that peer support at work accounts for more of the variance in whether training sticks than either supervisor support or organizational support. Separately, Lacerenza et al. studied 335 leadership training programs and found that practice-based methods, on-site delivery, and face-to-face formats were among the strongest predictors of success.

Three things follow from this. Practice in real work, not simulations: katas attach to conversations and decisions that are already happening, where the stakes and the social dynamics are genuine, rather than creating artificial scenarios. A colleague practicing alongside you. And feedback loops short enough to connect behavior to effect before the context fades.

Feedback in this system operates at three speeds. The closing statement in each kata is a self-check you run during or immediately after the moment. An optional same-day debrief with a buddy adds a second perspective while the interaction is still fresh. The weekly reflection aggregates patterns across multiple instances. The weekly cycle is not the primary feedback loop. It is the place where you notice trends.

This is why the format requires a practice partner, and why katas are designed to run inside existing work rather than alongside it.

## The Tech Lead Feedback Gap

The shift from individual contributor to tech lead removes the feedback mechanisms engineers depend on. Code compiles or it does not. Tests pass or they fail. As a tech lead, feedback becomes delayed, ambiguous, and socially mediated. Nobody tells you in the moment that you just solved a problem someone needed to solve for themselves, or that your standup comment shut down a conversation that needed to happen.

Patrick Kua interviewed more than 35 tech leads for _Talking with Tech Leads_ (2015). The same pattern keeps surfacing: engineers in leadership roles invest disproportionately in technical skills because those are familiar, and systematically underinvest in people and process skills. Not because they lack the capacity, but because the environment does not develop those skills the way it develops technical ones.

Gergely Orosz makes a related point in _The Software Engineer's Guidebook_ (2023): the tech lead role requires strategy and alignment work that individual contribution never teaches you. Risk identification, stakeholder management, timeline negotiation, and distributing decisions instead of making them yourself. A common failure mode is assuming that when a decision needs to be made, you should make it. Orosz argues for the opposite.

Without rapid feedback, engineers in leadership roles default to what worked before. They code when they should delegate. They answer when they should ask. They avoid conflict because the cost of raising it is immediate and visible, while the cost of silence is diffuse and delayed. These are not character flaws. They are untrained responses in an environment that does not correct them.

The katas target these defaults. Each kata in the catalogue names the default it replaces, specifies the alternative action, and includes a closing check. The weekly reflection asks whether the moment arose and what happened. Over time, this creates the rapid feedback loop that the role itself does not provide.

## Why Coaching, Not Teaching

Rother's central finding in _Toyota Kata_ was that Toyota's competitive advantage was not its tools or processes. It was a practiced pattern of thinking that managers repeated daily until it became habitual. He identified two linked routines: an Improvement Kata (4 steps for working toward a target condition) and a Coaching Kata (5 questions a manager asks instead of providing answers).

The Coaching Kata's insight is that the manager's job is not to solve problems but to develop problem-solving capability in others. The pattern works because it is rigid. The fixed structure removes the cognitive overhead of deciding how to respond. You execute the pattern, and the pattern handles the situation. Over time, the rigidity becomes invisible.

Wallo, Lundqvist, and Coetzer's 2024 review of 38 qualitative studies on learning-oriented leadership reinforces this. The leaders who most effectively developed their teams were not the ones who taught the most. They were the ones who structured work so that learning happened as a byproduct of doing.

Several katas in this collection train exactly that behavior. Kata 006 trains asking before answering. Kata 003 trains the shift from opinion to observation in code review. This is why katas prescribe rigid steps rather than general principles: the rigidity is the mechanism, not a limitation.

## Sources

Ericsson, K.A. and Pool, R. (2016). _Peak: Secrets from the New Science of Expertise_. Houghton Mifflin Harcourt.

Ericsson, K.A., Krampe, R.T., and Tesch-Romer, C. (1993). The role of deliberate practice in the acquisition of expert performance. _Psychological Review_, 100(3), 363-406.

Hughes, A.M., Zajac, S., Woods, A.L., and Salas, E. (2020). The role of work environment in training sustainment: a meta-analysis. _Human Factors_, 62(1), 166-183.

Kua, P. (2015). _Talking with Tech Leads_. LeanPub.

Lacerenza, C.N., Reyes, D.L., Marlow, S.L., Joseph, D.L., and Salas, E. (2017). Leadership training design, delivery, and implementation: a meta-analysis. _Journal of Applied Psychology_, 102(12), 1686-1718.

Neward, T. Architectural Katas. https://www.architecturalkatas.com.

Nimante, D., Kokare, M., Baranova, S., and Surikova, S. (2025). Transferring results of professional development into practice: a scoping review. _Education Sciences_, 15(1), 95.

Orosz, G. (2023). _The Software Engineer's Guidebook_. Pragmatic Engineer BV.

Rother, M. (2009). _Toyota Kata_. McGraw-Hill.

Thomas, D. (2003). Code Kata. http://codekata.com.

Wallo, A., Lundqvist, D., and Coetzer, A. (2024). Learning-oriented leadership in organizations: an integrative review of qualitative studies. _Human Resource Development Review_, 23(2), 230-275.
