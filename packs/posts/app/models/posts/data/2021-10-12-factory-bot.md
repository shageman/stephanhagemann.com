---
title: FactoryBot - Feeding the beast?
tags:
  - testing
  - test factories
---

==ActiveRecord (AR) is the main driver of incidental (read: superfluous) complexity in your app. Do not feed the beast.==
<!--more-->

Installing a library like factory_bot[^1] feeds the beast. It seems to give you superpowers and ... bam bam bam you are creating objects for your tests like it is nobody's business. Well -- and, you have just hurt your future you. It is an amazing library that you shouldn't use.
I believe that factory_bot adoption has a net negative effect in large code bases.

## Stop using factory_bot. Make your own ObjectMother
Using factory_bot makes the wrong thing easy: It makes tests easy that need to work with a complex AR object graph. You should keep that graph as simple as possible, not make it easier to grow and let it get out of control.
Writing your own ObjectMother[^2] (a factory class that can generate the objects you need for your tests) doesn't immediately stop the problem of proliferating AR, but it points you in the right direction to reduce complexity in your app. I will show you how to try this out in any codebase - in three steps.

## #1. Start an ObjectMother class
Change just one class to use your own ObjectMother and prove that it's possible. Check out the class in[^3] as a starting point.

## #2. Grow the complexity of your generators only as much as you need
The code in[^3] can create AR classes, build them, generate params for them and it has default overrides (with lazy loading). Creating this and using this doesn't even take more lines of code than using factory_bot.

## #3. Let implementation pain be your guide to simplifying
If you ever feel like writing the methods to create a new object is becoming painful, explore other patterns. Explore what you can simplify where (in your AR graph maybe?) to make building data for your tests less painful and refactor in that direction.

[^1]: https://github.com/thoughtbot/factory_bot
[^2]: https://martinfowler.com/bliki/ObjectMother.html
[^3]: https://github.com/shageman/package-based-rails-applications-book/blob/main/c2s01/sportsball/spec/support/object_creation_methods.rb
