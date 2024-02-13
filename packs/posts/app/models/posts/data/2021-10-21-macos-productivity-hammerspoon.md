---
title: Still using your mouse for window management on macOS? Stop! Hammerspoon!
tags:
  - macos
  - productivity
  - tools
  - automation
---

Hammerspoon[^1] boasts two things: a truly epic project name and a lua scripting environment that hooks into extensions that allow you to control system functionality in macOS.<!--more--> Over the years, it has completely changed how I do a couple small but important tasks. Hammerspoon is a generic tool, but the functionality I use *by far* the most is ==window layout management==.

## Stop using the mouse - Start using your keyboard (for navigation)

Navigating windows with the mouse is inefficient (it takes much longer than with the keyboard) and also somewhat ineffective (it is much less precise than with the keyboard). In order to use the keyboard for window management we first need to be able to navigate with the keyboard

So, first things first: `Cmd+Tab` and `Cmd+Shift+Tab` switches the current window to the next (or previous) *application*. Similarly, `Cmd+`\`  and `Cmd+Shift+`\` switch the current window to the next (or previous) *window* of the current application

## Keyboard-based window layout management

Using the mouse is bad for navigating windows, it is worse for managing their layout. Install Hammerspoon and either install a "spoon" (that's what they call extensions) like MiroWindowsManager[^2] or download my custom configuration[^3] and adapt it to your needs. Whichever solution you choose, the result is that you can now move to windows next to each other with lighting speed with a couple keystrokes and the windows will sit perfectly next to each other without overlapping.

Let's say I want to move VSCode next to iTerm:

> Cmd+Tab (repeat until I am on VSCode) ... Cmd+Opt+Ctrl+m ... <- ...
  Cmd+Tab (repeat until I am on iTerm) ... Cmd+Opt+Ctrl+m ... ->

The key combos may look gross, but once they become muscle memory, you'll navigate and manage windows so quickly, you won't want to go back!

[^1]: https://www.hammerspoon.org/
[^2]: https://www.hammerspoon.org/Spoons/MiroWindowsManager.html
[^3]: https://gist.github.com/shageman/8c96204296af1af65a03e2a6aaa2fb15