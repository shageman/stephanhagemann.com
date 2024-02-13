---
title: Can we improve how we test software using information theory?
tags:
  - testing
  - information theory
---

Try to hold these two ideas in your head
<!--more-->

> Information theory tells us that a message has more the more information the less predictable it is (or the more entropy it has)[^1]

> Software engineers constantly work towards a test suite that is always green (all tests pass).

## Information theory vs testing philosophy

000000000000000000000000000000000000000000000000000000000000

Think of this row of zeros as the list of exit codes we got from every run. They all passed. They are all "green." When we achieve a completely green test suite for a long time, from an information theory perspective, the amount of information here is just ==one bit== (read: not a lot for all the work put in). Is that worth it?

## When are tests worth it?

In my experience, the most likely time for a test to be red is when the code that is being tested is under development. I.e., on a developers machine - as the code is being written. Afterwards, most tests never fail again. This points at the fact that ==code changing== is a good indicator of when tests are needed.

And, therein lies the crux: every commit is a code change - and "I don't know which part of the app my change might impact" - so I have a good reason to run all the tests right? No. ==Modularization== helps us here by making large application smaller and reducing the effective "radius of change." But that's for a later date to explore.

## What if you were radical?

... ==Radically accepting== of the implications of the little information value we get out of our test suites. Here is an idea from James Coplien:

> If you want to reduce your test mass, the number one thing you should do is look at the tests that have never failed in a year and consider throwing them away.[^2]

[^1]: https://www.khanacademy.org/computing/computer-science/informationtheory/info-theory/v/intro-information-theory
[^2]: https://rbcs-us.com/documents/Why-Most-Unit-Testing-is-Waste.pdf
