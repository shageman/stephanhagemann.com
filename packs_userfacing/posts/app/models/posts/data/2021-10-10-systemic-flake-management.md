---
title: Flakes are a systemic problem that require a systemic response
tags:
  - testing
  - test flakes
---

```
expect(rand(100)).to be > 0
```
<!--more-->
If the above is your test, you wrote a flakey test. `rand(100)` will return numbers between 0 and 99 randomly. This test will pass only about 99% of the time[^1]. And there are subtle ways in which tests in practice get written like this. Especially when what is tested is the user interface of a modern web app, there are a lot of moving parts. Multiple requests to a backend that return data asynchronously. If identifying the completeness of these requests isn't done precisely, the test can be flakey. It is fair to argue: that's an individual test with a specific problem that should have an individual solution.

## Why it is so difficult to fix flakes individually

The single best word to explain why finding and fixing flakes is tough is: subtle. Because flakes are subtle they need deep investigations to be understood. And fixes are not always obvious either[^2].

## How to solve for flake management systemically

I believe we should create test result databases and start throwing all the tools of data analysis, visualization, and machine learning at them to deepen our understanding of the nature and shape of our flakes. Do they occur at certain times? Since a certain time? Do they occur in certain parts of the app? In certain kinds of tests? Does their frequency change over time?


When we find patterns in the commonalities of tests that flake, we can systemically tackle fixing or mitigating them. We can not do this if we look at tests individually.


[^1]: https://www.jdoodle.com/ia/hSy
[^2]: https://www.smashingmagazine.com/2021/04/flaky-tests-living-nightmare/
