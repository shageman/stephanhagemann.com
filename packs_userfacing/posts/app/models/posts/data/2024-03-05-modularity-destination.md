---
title: "What is the modularization destination for large apps?"
tags:
  - gradual modularization
  - architecture
---

When talking to developers about gradual modularization, one of the questions is, "So... where are we headed?" That is, what is the destination of a modularization journey? 

<!--more-->

The context these developers find themselves in is that they all work in a large, monolithic codebase. Shopify, Github, GitLab, and my employer, gusto, are just a few examples of large companies in similar situations. These companies, and many others, are built using Ruby and Rails as a significant part of their backend systems. 

Through working on component-based application design for over a decade and building the gradual modularization and package-based ecosystem for the last couple of years (if you are looking for an intro to these, check out Alex's blog posts [https://engineering.gusto.com/laying-the-cultural-and-technical-foundation-for-big-rails/](https://engineering.gusto.com/laying-the-cultural-and-technical-foundation-for-big-rails/) and [A How-to Guide to Ruby Packs, Gusto's Gem Ecosystem for Modularizing Ruby Applications](https://engineering.gusto.com/a-how-to-guide-to-ruby-packs-gustos-gem-ecosystem-for-modularizing-ruby-applications/), or [https://gradualmodularization.com](https://gradualmodularization.com)), I believe there is a juncture that all of these companies should strive to move their packages towards. This juncture is this:

> Gradually modularize packages towards extractable applications and libraries.

![Picture of a safe intersection](/images/posts/2024-03-05-intersection.png)

Let's take the two parts of the destination in turn: 1/ What do we mean by applications and libraries, and why are they the target? and 2/ What is extractability, and why is it a target?

## What we mean by application and libraries

I want to use the term application here as software that is run to do whatever it was designed to do. This can, for example, be a desktop application, a web server, or a lambda function. Anything that, in an operating environment, can be started and then do its thing. In this broad sense, all software we see the effects of or interact with is applications. What we casually call a "Rails app" is an application in this sense.

Libraries are pieces of software that have a packaging and distribution mechanism and that are included in applications, extending their runtime capabilities with the functionality offered by the library. In Ruby, gems are often libraries in this sense. 

There are technical constraints in how we can combine applications and libraries:

* Applications can interact with other applications by calling their exposed functionality.
* Applications can use libraries by including them. 
* Libraries can compose functionality by including other libraries. 

There is nuance here that we will largely gloss over for the sake of length: there are libraries that have application characteristics, e.g., gems including rake tasks that execute like applications, gems that are applications like visualize_packs.

All software is either an application or a library in the sense described above.

## Applications and libraries

If we go back to the context in which developers ask themselves whether they should use something like the tooling offered by RubyAtScale, we go back to the fact that folks work in monoliths. It is a bummer that that is the term the industry landed on because it emphasizes that there is one (structure) but fails to emphasize that folks tend not to believe that it is of uniform structure - that it represents one thing. Quite the opposite: we tend to use it for software that has multitudes in it—multitudes of responsibilities, domains, teams, and, by extension, could have a multitude of applications and libraries in it.
In monoliths that use the RubyAtScale ecosystem, we divide up the application code of a Rails app into packages. If we ask for every package whether it wants to be an application or a library, we can give one of the following answers:

1. A given package wants to be an application
1. A given package wants to be a library
1. A given package wants to be... "well, we're not sure yet."
1. A given package wants to be both

If the answer is #1 or #2 for the given package, we can turn to the question of what extractable means and how to pursue it. The other two options require more interrogation. If we are at #3 (unsure), we need to do something to allow us to learn more before proceeding. In applications of the size we're talking about here, you can turn to a different package for which the answer is not #3. If the answer is #4, you have just found a package that is a monolith, and you might consider splitting it apart.

# What makes a package extractable

We use the term extractable for packages that can do their when extracted from the monolith.

A specific practical implementation of this notion of extraction could be the following:

> The tests of the codebase pass even after deleting all other packages from the application.

If a package has dependencies on other packages, this might change to:

> The tests of the codebase pass even after deleting all packages from the application that are not direct or transitive dependencies (via accepted dependencies or violations) of the package.

Note that this second, more general statement doesn't prove anything for a single package but rather the remaining group of packages.

## What makes a library extractable and extracted

For libraries, let's assume that they enforce a package dependency structure. To test the extractability of a package that wants to be a library, take one that has no more dependencies (or violations) on other packages and do the following:

* Move package code (production code and test code) into a new repository,
* Run the tests and fix the viibile error. Repeat. 
* Profit

![Gnome pointing at three phases](/images/posts/2024-03-05-3-phases.png)

With these "lists of three," expect the core problem to be in the middle. In a discussion about Shopify's recent article on packwerk retrospective, one of the authors said that when they did this kind of process, even though they had removed all packwerk violations for a package, only 40% of the tests passed when they initially extracted in. That is expected because while packwerk is a tool that aids in the process of getting toward extractability, it doesn't support every part of that process.

Here is a list of some of the things that will likely cause errors when doing the above:

* Shared test configuration that needs to be carried over (or tests need to be adapted)
* Shared test helpers
  * Shared test helpers that hide the fact that entanglements were still present from packwerk via meta-programming (factory_bot)
* Shared application configuration that changed default behavior (initializers)
* Product-code metaprogramming that packwerk couldn't detect

## What makes an application extractable

For applications to analyze extractability, many more preconditions must be met before we reach extractability.

* They enforce Public APIs
* The Public APIs take and return primitive types (and compositions) only, not function-laden objects
* There are no privacy violations
* Their database is separate

These are just the ones applying to the application and the other applications it collaborates with. There is one more precondition for the whole system, and it is a doozy:

* The ability to turn any package public API that takes and returns primitive types into an application-external API, e.g., via tools like GRPC, REST, or GraphQL

If you actually want to run an extracted application separately, you must turn the needed APIs from internal, packwerk-public APIs to externally available ones.

Once done, the steps to test extractability are 

* Move package code (production code and test code) into a new repository,
* Run the tests and fix the viibile error. Repeat. 
* Profit

In addition to the list we had for libraries, there will be the following things to fix

* Replace calls to now unknown constants with the equivalent public API on the original application
* Get the data of the extracted application into the right state

Note, in large applications, you may think of groups of packages as wanting to become an application together. In these cases, the description of this section still works, but some of the ways of doing it change.

## Why extractable and not extracted?

In both cases, when we get to the "profit" step, the work involved in that step goes something like this:

* Create the repo, 
* Make it a gem or application, 
* Share it with the org (via an internal gem server or by deploying the app), 
* Add the dependency/interaction to the original host application, 
* Remove the package's code from the package and rely on the implementation.

An extraction creates the value of complete separation at the cost of having to maintain that separation and the resulting artifacts. 

## Where to start, where to stop

The starting point for all of this work, going back to the beginning of this post, is the lack of extractable parts of the codebase and not a lack of extracted parts. The decision on how far to go with extractability and whether to extract is a tradeoff decision of impact and work involved. 
We can depict this choice with a continuum between the three points.

![Diagram of a Continuum from _not extractable_ to _extractable_ to _extracted_](/images/posts/2024-03-05-continuum.png)


We said above that the juncture is this:

> Gradually modularize packages towards extractable applications and libraries.

In this lies the last nuance to the goal of gradual modularization: You decide how far to push along the continuum for each package. This will give you many options for what to pick and optimize for different aspects while on the journey:

1. Pick a small, relatively unentangled package to learn or teach the process.
1. Pick a package responsible for a core part of the business if it lacks stability.
1. Pick a package that feels auxiliary to the application's core to protect the core from getting bloated.
