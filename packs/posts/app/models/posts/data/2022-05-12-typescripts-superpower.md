---
title: "TypeScript's superpower"
tags:
  - gradual typing
  - typescript
---

In his post [When Static Types Mask Code Smells](https://www.spicyweb.dev/static-types-mask-code-smells/) [Jared White](https://www.spicyweb.dev/about) reflects on a discussion about TypeScript and makes the case that static typing isn't a panacea. It does not fix all your code problems. Indeed, it does not!

<!--more-->

Jared closes with this observation:

> Every programmer and every project is different, with unique needs. We should celebrate a diversity of approaches and techniques—**not expect the industry at large to fall in line with a single perspective.**

This is where I want to nitpick his analysis a little bit.

It is not that every programmer or every project has unique needs. **From one area to another *in one codebase* we find different needs.**

The core of that calculation module that has been driving the whole business for years. Different needs then the experimental service being tested on pilot customers. Different needs then the new web app component. Different needs than the high-performance logging engine.

==TypeScript's superpower that it supports different needs within an application (even within one file or class!) with different levels of static typing - by allowing for **Gradual Typing**.== And it is not just TypeScript. Ruby has it with [RBS](https://github.com/ruby/rbs) or [Sorbet](https://sorbet.org/). Python has it with [type hints](https://docs.python.org/3/library/typing.html). Folks are proposing it for [Elixir](https://arxiv.org/abs/2104.08366), heck, even for [Java](https://uwspace.uwaterloo.ca/handle/10012/10409).

Gradual Typing was invented by [Walid Taha](http://www.effective-modeling.org/p/walid-taha.html) and [Jeremy Siek](https://wphomes.soic.indiana.edu/jsiek/). Jeremy Siek has a beautifully simple slide in his [TFP 2013](https://jeapostrophe.github.io/conferences/2013-tfp/) [keynote](https://wphomes.soic.indiana.edu/jsiek/files/2013/06/tfp2013-keynote.pdf) about the goals and benefits of gradual typing:

![Gradual Typing offers both reliability and efficiency as well as productivity](/images/posts/siek-benefits-of-gradual-typing.png "The goals of Gradual Typing")

> Enjoy the benefits of static & dynamic typing in different parts of the same program

Apparently, the only problem with Gradual Typing (and I found this while looking for languages that support the concept) is...

![Google search for "gradual typing is"](/images/posts/gradual-typing-morally-wrong.png "Gradual Typing is...")

🤷🏻