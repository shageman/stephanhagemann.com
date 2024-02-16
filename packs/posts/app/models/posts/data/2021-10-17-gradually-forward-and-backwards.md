---
title: The one reason that Gradual Modularity is relevant for all languages is totally backwards
tags:
  - gradual modularity
  - refactoring
---

If you have read any of my posts about gradual modularity and thought "well this is only interesting for those folks who messed up their (Rails) apps on their own in the first place," read this post. I don't believe that is true: ==Gradual Modularity can benefit engineers working in most languages and frameworks.==

<!--more-->

## Gradual Modularity allows us to go forwards *and backwards*

Gradual Modularity does provide us with the means to gradually, aspect by aspect, improve the modularization of an application[^1]. The destination being a "perfectly" modularized application.

We should not forget, however, that we don't just have to the ability to go *towards* better modularization. **We can also refactor away from better modularization.**

## Why you shouldn't discount the option of going "the wrong way"

> for each desired change, make the change easy (warning: this may be hard), then make the easy change -- Kent Beck[^2]

Imagine that a new business opportunity just came along. It is promising millions in additional revenue. It has to be acted on fast. There is really just one hitch: The features needed require a couple of modules to be combined in a way that they are currently not built to support. Building a couple of APIs will mean coordinating between several teams and that will take time - add to that the time it will take to build the new features on top.

With Gradual Modularization, none of the module boundaries are hard - irreversible. Gradual Modularization creates many reversible decision points.

==With Gradual Modularization we can simply ignore all the boundaries for this situation and *just build* the feature in the most straightforward way we can see.== In that sense, maybe the change was already easy?

[^1]: /posts/2021-10-16-gradual-modularity-definition2/
[^2]: https://twitter.com/kentbeck/status/250733358307500032