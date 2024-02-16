---
title: Gradual Modularity - A definition attempt
tags:
  - gradual modularity
---

Yesterday's attempt at a concise description of what Gradual Modularity is[^1] fell short of being a definition. Here is another attempt at that.

<!--more-->

## "Classic" Modularity

> Modular programming is a software design technique that emphasizes separating the functionality of a program into independent, interchangeable modules, such that each **contains everything necessary** to execute only one aspect of the desired functionality (my emphasis) [^2] 

## Gradual Modularity

**In extension to classic modularity, Gradual Modularity removes the need for modules to *contain everything necessary* by introducing two novel concepts to module construction:**

1. **Explicate the various aspects of modularity in an extensible list**
2. **Allowing for every one of the modularity aspects to be attained gradually**

## Modularity aspects

The modularity aspects I see today are

* Defined dependencies
* Adherence to public API
* Defined public API
* Typing of public API
* Namespace isolation
* Database isolation
* Configuration isolation
* Process isolation

## Gradual attainment

I believe that all of the above aspects, except for maybe process isolation, can be attained gradually. Meaning, that for a given module we can observe which parts of the module adhere to an aspect, for example on classes or files.

Classic Modularity is one point in the space created by the dimensions of Gradual Modularity, namely the one where all aspects are fully attained.

[^1]: /posts/2021-10-15-gradual-modularity-definition/
[^2]: https://en.wikipedia.org/wiki/Modular_programming

