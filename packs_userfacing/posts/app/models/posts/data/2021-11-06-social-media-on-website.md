---
title: Make Your Self-hosted Website Come To Life By Connecting It To Your Social Media
tags:
  - personal website
  - webmentions
  - social media
---

I have always felt like I wanted *my web content* to *be on my website*. I have also always felt that my website is a pretty lonely and inactive place.
<!--more-->

Recently, I connected my website to my social media (twitter for now), by following an article by ==Sia Karamalegos==[^1].

## The stack I connected

I currently write my website (this website) with **eleventy**, **javascript**, **nunjucks**, and **markdown**. The main framework in this list is eleventy - a static site generator. I currently store the source code on github and deploy the site to netlify. At the time of writing her article, Sia used the same stack.

Sia's article explains how to use **webmentions**[^2] and **brid.gy**[^3] to retrieve and show twitter conversations, likes, and retweets. Exactly what I wanted to make my content more engaging even if I don't write a new *post* every day.

If you run on the same stack you can follow Sia's article[^1] completely. Problems I ran into stemmed exclusively from me learning the tools involved.

## How things work in the background

The main tool that ensures my website can know what twitter discussions are going on about it is brid.gy. It regularly scans twitter for my tweets and replies to them and forwards them to webmentions.io. Brid.gy has an extensive documentation: Be sure to read it - you need to post in the right way for content to get picked up.

## Keeping up-to date with social media

Since eleventy is a static site generator, new social media content won't be included unless we make sure our website knows about it regularly. That is why the final step in the process is to regularly deploy our website[^4]. ==Now, every time a deployment happens, new twitter related to my website's content gets added automatically.==

[^1]: https://sia.codes/posts/webmentions-eleventy-in-depth/
[^2]: https://webmention.io/
[^3]: https://brid.gy
[^4]: https://ericjinks.com/blog/2019/netlify-scheduled-build/
