---
title: "🧵 A thread about gusto’s newest #bigrails open source work"
tags:
  - gradual modularity
  - tweet
---

<!--more-->

🧵 A thread about gusto’s newest #gradualmodularity (nah, I should say #bigrails) open source work: It is all about managing big Rails applications with a lot of people!

There is a lot, so buckle up!

See them all at https://github.com/bigrails

...

This work is part of what the _product infrastructure_ team does at https://twitter.com/gustohq!

If stuff like this is interesting to you, DM me (on twitter) or find me elsewhere and let’s chat!

...

First up https://github.com/bigrails/stimpack! This gem makes organizing your Rails app’s folders such that they work well with packwerk a breeze. Just point it at a folder and all needed autoloading is done for you! Kudos to https://twitter.com/nganpham!

...

We use https://github.com/bigrails/bigrails-teams to create the concept of an engineering team in our codebases as an explicit construct. This can be used to route errors, notifications, deprecations, etc. In short support for breaking down a large app by team. Which brings us to...

...

https://github.com/bigrails/code_ownership! We use this gem to ensure that every file in a codebase has an owner. This way, for example, we can ensure that every error can be routed to a team.

...

With https://github.com/bigrails/danger-packwerk  we get to direct support for #gradualmodularization work. This gem contains a danger plugin that will make inline comments on GitHub PRs that add packwerk violations. This helps teams know about and learn about boundary violations and what to do!

...

That danger is https://github.com/danger/danger btw

...

We published a VSCode extension, too! https://github.com/Gusto/packwerk-vscode. This extensions gives you that warm fuzzy feeling of a red squiggly line underneath a constant when you happen to create a privacy or dependency violation in the code you are writing.

...

If you read my book Gradual Modularization with Ruby and Rails, the gem https://github.com/bigrails/package_protections will feel familiar. It is our implementation of the ideas from Chapter 3! It is an opinionated framework for protecting more aspects of modularity than just privacy and dependency.

...

Last but not least: https://github.com/bigrails/modularization_statistics. This gem reports modularization stats to data dog, so you can build yourself a bunch of sweet dashboards that show overall progress. We have it connected to teams, code ownership, and package protections as well.

...

All of these gems have seen herculean efforts by https://twitter.com/AlexEvanczuk to get them built and to get them open sourced.

Hint: Alex will be at https://twitter.com/railsconf next week talking about all of this stuff (https://railsconf.com/program/sessions#session-1321)! 

...

Hint hint: a bunch of Gusties will be, including me ;)

