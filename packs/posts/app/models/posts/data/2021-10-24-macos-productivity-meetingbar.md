---
title: Never able to find that zoom link fast enough? Always late to the next meeting? Use MeetingBar!
tags:
  - macos
  - productivity
  - tools
  - meetings
---

MeetingBar is for you if you use a calendar and you regularly participate in video calls[^1].<!--more--> It works with meet, and zoom, and teams, and more - and I have found it to help me remember my meetings in time and for it to eliminate a bunch of annoying clicks for getting in.

I previously covered Homebrew to install and manage macOS applications[^2]. Install MeetingBar as follows:

    brew install --cask meetingbar

Once installed, MeetingBar lets you open the next video call with a keyboard shortcut.

## Bummer: Your calendar has to be added to macOS

For some folks, the big downside of MeetingBar is that it only integrates with the calendars added the the native macOS calendar app. In my opinion: It is 100% worth it  if you have multiple calls a day.

If your calendar isn't yet added to macOS, you can do so via System Preferences. Click on "Internet Accounts" to add the account and make sure that the calendar gets synchronized. If afterwards, you find that you don't want the notifications from the calendar app, adjust the settings via System Preferences -> Notifications.

## One shortcut -> next meeting! Profit.

For me the shortcut is

    Cmd+Opt+Ctrl+n

and the next meeting opens right away!

MeetingBar also adds a handy system bar icon where you can see all your upcoming meetings and their start times.

There are two caveats I can think of with using MeetingBar: if you are double book for a given time, you will join one of those meetings... which may not be the one you expected. Also, because MeetingBar uses the macOS calendar it sometimes can take some time (minutes mostly) to update  (namely when the underlying calendar hasn't synced to your computer yet).

[^1]: https://github.com/leits/MeetingBar
[^2]: /posts/2021-10-20-macos-productivity-homebrew/