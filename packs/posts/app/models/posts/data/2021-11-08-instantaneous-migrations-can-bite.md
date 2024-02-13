---
title: "Software Engineers Beware: Even Instantaneous Migrations Can Bite"
tags:
  - technical migrations
  - instantaneous migrations
  - dependencies
  - hacking
---

This is an old example, but a good reminder: even instantaneous migrations can bite you in the ass. Be careful.

<!--more-->

My friend, Ben Smith, published the `be_truthy` gem years ago[^1]. It is a great example of what can go wrong with instantaneous migrations. I mentioned this kind of migration recently[^2]: When you can migrate an entire codebase to a new dependency with a change in only one place. Perfect efficiency. Dependabot makes this even easier.

## Dependabot is awesome

Dependabot is Github's automatic dependency upgrade tool[^3]. It will send you pull requests (PRs) into repos with languages it understands and propose to update your dependencies. Because the PRs get opened automatically, with the right integrations, your CI will inform you, without interaction, whether your application works with the updated library.

One click. PR merged.

## And potentially dangerous

The `be_truthy` gem's name might indicate that you get some sort of truthiness comparison out of it. It actually tries to exploit a feature of the Ruby library install system that allows for **arbitrary code execution during the installation of a gem.**

**Imagine someone maliciously taking over one of the libraries you use. Imagine they introduce functionality to take over your machines into an otherwise perfectly well-behaved gem.**

==How much do you verify that the libraries you depend on are trustworthy?==


[^1]: https://github.com/benjaminleesmith/be_truthy/tree/master/lib
[^2]: https://stephanhagemann.com/posts/2021-11-07-naming-technical-migrations/
[^3]: https://github.com/dependabot