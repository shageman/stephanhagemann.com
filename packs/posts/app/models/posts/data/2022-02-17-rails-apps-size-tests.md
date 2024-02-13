---
title: Rails Apps Size Tests
tags:
  - ruby
  - rails
---

Want to generate some quick stats for the size of your Rails app (and likely some of its problems)?

These are the queries I used to generate graphs for some big open-source Rails app for my 2014 RailsConf talk [Refactoring towards Component-based Rails Architecture](https://speakerdeck.com/shagemann/refactoring-towards-component-based-rails-architectures-at-railsconf-2014?slide=19).

<!--more-->

## How many lines of Ruby do you have in your app?

```
find . -iname "*.rb" -type f -exec cat {} \; | wc -l
```

## What are your biggest files?

```
find . -iname "*.rb" -type f -exec wc -l {} \; | sort -rn
```

## Which classes have the most `has_many` relationships?

```
ack " has_many " -c | awk -F ":" '{print $2,$1}' | grep -v "0" | sort -rn
```