---
title: Should Product Development Teams Be Done With The *Definition Of Done*?
tags:
  - agile
  - post-agile
  - impact
---

I recently came across a very practical application of the analysis of agile vs post-agile[^1] in a simple observation from a new team member: "It seems like our *definition of done* is really unclear."

<!--more-->

## The need for a definition of done in agile

The *definition of done* is a foundational artifact of agile practices (as differentiated from pre-agile and post-agile). [^2]

It is the focus on **velocity** in agile that creates the need for a counter-balance to the desire to "go fast." How do you make sure you apply a similar yard stick to velocity? You create a definition of done. For example, "a story isn't done until it is merged into the main branch, has unit and integration tests, has been validated by QA, and is marked as done in the backlog."

In a post-agile process, things are always viewed from the perspective of *impact*.

## Replace the definition of done with a *celebration of impact*

If our implementation of a feature isn't in production it is likely not creating impact. Certainly not if it is only on the main branch. It is also not creating impact when it if behind a turned-off feature flat. If the newly implemented feature breaks production deploys, it doesn't have positive impact. If it breaks production for a service, it has negative impact.

We can use QA to assure quality. We can write (and should) automated tests to verify that things work as expected. And we'll often be so sure about these aspects that we'll call them part of what we need to do to be done.

And still, an ==*impact lense* focuses us more on the business change we would like to see. It thus creates a stronger incentive to do the right thing and leaves room to adjust what that means for different kinds of work.==

[^1]: https://stephanhagemann.com/posts/2021-11-05-evaluate-software-teams/
[^2]: https://www.agilealliance.org/glossary/definition-of-done
