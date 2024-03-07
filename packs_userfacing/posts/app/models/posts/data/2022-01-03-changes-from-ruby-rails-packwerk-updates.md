---
title: Gradual Modularity changes from recent Ruby, Rails, and packwerk updates
tags:
  - gradual modularity
  - ruby
  - rails
  - packwerk
---

How do Ruby 3, Rails 7, and packwerk 2 affect the source code for [Gradual Modularization for Ruby and Rails](https://leanpub.com/package-based-rails-applications)? Let's find out!

<!--more-->

Over the past couple of days, I updated the [code generation scripts](https://github.com/shageman/package-based-rails-applications-book/commit/58a47797e4c3052ac10e3c399861c9cac970fb5d) and the [code samples](https://github.com/shageman/package-based-rails-applications-book/commit/a89c7feacbecd4379e1f27b95ac56d7171757bb0) for the Gradual Modularity book. 

## Changes due to Ruby 3.0.1 - nothing

Ruby 3 has been out for over a year. Reflecting on it, I don't know why I didn't update the code much earlier. Ruby 3 comes with a [whole host of new feature](https://www.ruby-lang.org/en/news/2020/12/25/ruby-3-0-0-released/).

No changes to code generation stem from the update to Ruby 3. One interesting option with Ruby 3 is that we could try to switch from [sorbet](https://sorbet.org/) to [RBS](https://github.com/ruby/rbs).

## Changes due to Rails 7 - a few frontend changes

Check out the [code samples](https://github.com/shageman/package-based-rails-applications-book/commit/a89c7feacbecd4379e1f27b95ac56d7171757bb0) and you will see a ton of changes. This is typical and expected and not in itself particularly insightful. 

It is better to look at the [code generation scripts](https://github.com/shageman/package-based-rails-applications-book/commit/58a47797e4c3052ac10e3c399861c9cac970fb5d) to see the delta to the changes Sportsball needs to make to the starter app. 

Turbo and Stimulus are in. Webpack is out. This leads to a couple of Javascript loading changes, e.g. in `application.html.slim` or `importmap.rb`. The opportunity with change is to switch the asynchronous frontend communication example in the [event-based refactor of C5S09](https://github.com/shageman/package-based-rails-applications-book/tree/main/c5s09/sportsball).

## Changes due to packwerk 2 - great simplification

Packwerk was updated to version 2 because of some changes to the configuration introduced by my fellow gustie [Alex Evanczuk](https://github.com/AlexEvanczuk) in [PR #159](https://github.com/Shopify/packwerk/pull/159). Most notably, we no longer need to specify `inflections` or `load_paths`. These two options were previously in place to improve packwerk load times. Now, after some speed-up work, they both don't need to be cached anymore and are instead both pulled from the Rails app directly.

The generator scripts saw 417 deletions with only 40 additions. Basically the entire net reduction in lines stems from deleting now obsolete packwerk config lines!
