---
title: Gradual Modularity - What is it?
tags:
  - gradual modularity
---
<!--more-->

The largest software development organizations in the world make heavy use of microservices (or service-oriented architectures) - one kind of ==modularity== that allows organizations with thousands of developers to be productive.

## Our options today create a great hurdle for modularization refactoring work

Beyond classes and objects, the most common mechanisms to achieve modularity are ==libraries== (running within the application process and ==services== (running outside of the application process as standalone applications). These kinds of modularity create “perfect isolation.” *Perfect* in the sense that the functionality of these libraries and services *verifiable in isolation*.

From the perspective of ==refactoring towards== libraries or services, the perfect isolation property poses a problem: **The extraction refactoring needs to create “perfect” isolation, too.** That is a daunting proposition for apps that have developed into “balls of mud” (lets say because of an over-eager object-relational-mapper layer - read: basically every Rails app in the world) - things are simply too entangled for this process to be easy.

## Gradual Modularity removes the modularization refactoring hurdle

Gradual Modularity removes the need for perfect isolation. Take two parts (let’s call them packages) of an application that we’d like to modularize:

Only partially known dependencies? Only partially defined public APIs? Some usage of private code? Partially clobbered namespaces? Only partially separate databases? All of this doesn't work with services or libraries. ==It is totally fine with gradual modularity.==

For each package we can define and lock in the level of isolation that we’d like to achieve for the moment. Depending on the level, ==**violations are allowed**==. Violations don’t break the app, instead they are recorded in todo-lists that are checked in with the code.

==Gradual Modularity, through allowing partial, leveled isolation and todo-lists for outstanding isolation work, gives developers a toolset to confidently and iteratively refactor towards a perfectly modularized system.==

Follow along with me as I am writing a book on Gradual Modularity at https://leanpub.com/package-based-rails-applications
