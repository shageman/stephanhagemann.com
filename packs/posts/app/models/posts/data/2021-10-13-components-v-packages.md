---
title: Switching to packages is a game changer (says the guy who pushed for components for almost a decade)
tags:
  - gradual modularity
  - components
  - packages
---

<!--more-->
Let's start with how I use the two terms:

When I say ==components==, I mean individually tested, isolated, explicitly dependent, and composed software parts that are combined to make the functionality of an application[^1]. In practical terms, components in various languages are Ruby gems, Java Maven projects, or Node modules.

With ==packages==, I am referring to more-or-less individually tested, more-or-less isolated, and composed software that are combined to make the functionality of an application. Packages don't widely exist and they have been introduced to Ruby only a year ago when Shopify open-sourced packwerk[^2].

I pushed for components for a long time: Hear me when I say: ==Stop. Use packages.==

## Separating code into components (or services) is a big decision
In order to make components - the same goes for service creation or extraction btw - some big decisions come first: Which functionality should live together? What should its API be? It also comes with a lot of work: Set up a separate test suite. Set up and maintain the new CI/CD pipeline. These decisions and this work is risky: what if we get it wrong?

Software engineers wouldn't put this work in if it weren't worth it though. So why do we do it? To manage complexity. ==To ensure that the incidental complexity of our application is not too much higher than the essential complexity of our domain.==

## Don't look back

With packages, you replace the "one big decision" of components with many, many, much smaller, easier, and far less consequential decisions around packages[^3]. That is why packages are a game changer: we can get to the same destination, but ==**we can get there with waaaaay less risk along the way.**==

[^1]: https://cbra.info
[^2]: https://github.com/shopify/packwerk
[^3]: https://leanpub.com/package-based-rails-applications
