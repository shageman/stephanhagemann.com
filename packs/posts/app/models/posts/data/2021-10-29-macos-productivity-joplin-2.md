---
title: Switching to Joplin will transform your daily note taking
tags:
  - productivity
  - tools
  - joplin
  - note taking
  - technique
---

There are a bunch of note taking apps that seem pretty hip right now. The most en vogue might be notion and obsidian. I want you to known about a lesser know, open source alternative called joplin[^1].
<!--more-->

## Use and share your notes on all your devices

Joplin can run on the most common operating systems: linux, windows, and mac. It also runs on Android and iOS. Your notes can be synced between any and all of these systems via a cloud service of your choosing, like dropbox, OneDrive, or AWS S3. You can also host the synchronization service yourself via nextcloud or joplin server.

There is a rich text editor built into Joplin, which I don't use because I prefer the editing speed of markdown[^2]. I find the markup-only way of editing rich text to be the fastest option on any device.

Use homebrew[^3] to install joplin on macOS:

    brew install --cask joplin

## The two steps that create a simple daily notes routine

First, create a new notebook to hold your daily notes. Mine -- because naming is hard -- is called "DailyNotes"

Second, every time you find yourself wanting to take a random note, within the daily notes notebook, check if you already have a note for the day. If not, create a new note by clicking the blue document icon or by pressing `Cmd+N`. Start writing by adding the current date as the title. For today I would use `#2021-10-29` (year-month-day sorts the best in lists). Then, every note gets a secondary heading to separate it from the others, like `## some important phone number`.

[^1]: https://joplinapp.org
[^2]: https://en.wikipedia.org/wiki/Markdown
[^3]: http://stephanhagemann.com/posts/2021-10-20-macos-productivity-homebrew/