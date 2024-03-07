---
title: Three reasons why the one legitimate criticism of Gradual Modularization falls short
tags:
  - gradual modularity
---

I have found one criticism of gradual modularity that resonates:

> **Gradual** is really just **somewhat**. This whole idea has no teeth and won't lead to actual change with positive impact.
<!--more-->

One of the biggest companies in the world (Amazon) famously built a huge part of what it is today (AWS) based on the mandate that all teams were to expose their data and functionality through service interfaces[^1].

## Most direction setting and changing is gradual
Non-gradual change is pretty rare. That's because any complex system has inertia that keeps things similar for a while. It is not a bug but a feature that a software engineering principle supports gradual change well.

## Strong mandates can be built on top
A gradually modularized system can strongly enforce certain properties (like, you must expose service interfaces). The gradualness doesn't preclude that. What it does do is make it easier for us to change our mind about what those "certain properties" should be.

## More flexibility day to day with very clear principles fort the long run
With gradual modularity one might go after namespace independence one day and dependency consolidation the next day, but there is no doubt about the overarching theme: Discover and implement more relevant dimensions in which modularity can improve the system being built.

In conclusion, I believe that all other things equal, ==an organizational system that allows for and improves more gradual changes is **always strictly better**.==

[^1]: https://gist.github.com/chitchcock/1281611
