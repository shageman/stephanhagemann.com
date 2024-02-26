---
title: You should want more data out of your (flakey) tests
tags:
  - testing
  - test flakes
---

If you are working with a large codebase, then you are likely dealing with test flakes. Flakes? Tests that, ever so often, report a failure where no relevant change to the system has happened. Google seems to think that a certain amount of flakes is unavoidable[^1] and I agree. 
<!--more-->
Because flakes are by nature random, it is often difficult to find the root cause - so ==we should think about all the ways we might be able to help ourselves in the search for mitigations==.

## We should have more error codes

Typical continuous integration (CI) systems rely on unix exit codes to mark build steps as successes (0) or failures (1 or some other value greater than 0). The usual assumption is: if the test fails, it fails its assertions. With flakes, this analysis is not enough to describe the various ways in which this can happen. Especially when you add retries to your tests to mitigate the bad impact of flakes[^2].
With flakes and ==retries== a bunch of situations can happen:

* The test passes right away
* The test passes after 1 or 2 or 3 (or more) retries
* The test fails despite all retries

That is already ==five different scenarios==! And it doesn't even account for the test runs of yesterday and the days before... There is a lot of data in how your tests fail. Wouldn't it be great if there was an exit code for each one of these scenarios you could analyze better after the fact? The problem is that we only have one error code (0) for success and we already identified four different success scenarios. What to do?

## Exit codes aren't enough - we need a test result database

This quick analysis shows us that if we want to dig into the ways our tests flake and fail, we need something more than just plain old exit codes. We need a ==test result database== where we can add all test results to enable analysis of failure patterns: how many failures in a row? time of day? day of week? day of month and year?
This is way more than just messing with exit codes. Analyzing tests and their failures is a big project in and of itself.

[^1]: https://testing.googleblog.com/2016/05/flaky-tests-at-google-and-how-we.html
[^2]: https://duckduckgo.com/?t=ffab&q=test+retry&ia=images
