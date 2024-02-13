---
title: Naming 3 types of technical migrations to make us better at tackling them
tags:
  - technical migrations
  - instantaneous migrations
  - localized migrations
  - global migrations
---

The cost and benefits of technical migrations are hard to pin down. Discussing them efficiently is also difficult without properly understanding what we are talking about. This article creates a nomenclature to help with this.
<!--more-->

Let's say you have an app that has 100 files of code and 75 of those files use SOMELIBRARY for part of their work.

## No breaking changes: Instantaneous migrations -> no "per file" work

When SOMELIBRARY gets an update without a breaking change, all 75 files get the update at the same time (without any change to them). Similarly, if there is SOMEOTHERLIBRARY that implements the functionality behind the same API, there is nothing to do other than flip the reference. Well... your CI system better run your test suite to verify that the claims of "no breaking API change" are in fact true. All this holds true for external services that implement the same API.

==We change the reference to the dependency in one file.==

## Hidden changes: Localized migrations -> little "per file" work

Let's say SOMELIBRARY is implemented by us (in three files) and implements developer alerting. The API used under the hood changes from email to discord, but the API used by the rest of the system stays with the parameters `for_who` and `what` and the reference to SOMELIBRARY stays the same.

==We change the implementation of the dependency in a few files.==

## Breaking changes: Global migrations -> lots of "per file" work

If the API of SOMELIBRARY changes, we have to update the API usage in 75 files. These changes lie on a spectrum from very mechanical (e.g., change a parameter name) to very artisanal (e.g., understand and mitigate the runtime and memory implications of the change).

We want to avoid breaking changes because they are harder to migrate than the other kinds.
==Can we design changes so the migrations become easier? Can we design breaking changes to allow for more technical migrations?==
