---
title: 2 ways homebrew for macOS is ... even better
tags:
  - macos
  - productivity
  - tools
---

Homebrew[^1] describes itself as "The Missing Package Manager for macOS (or Linux)." The program primarily installs command line applications but through its various extensions is, in my opinion, the best way to install and long-term manage applications on a Mac.<!--more--> If you can find it through homebrew you should not download and install it directly and you should not use the Apple app store.

The standard command to install software is brew install zip (the name of some software in the homebrew list of formulae). You can search for apps on the homebrew homepage.
Homebrew really shines when you use it with a couple of extensions.

## Installing a default set of programs

    brew bundle dump

This command will create a file called Brewfile in which is listed every application that homebrew has installed on this system[^2]. You can use this to easily install this list of software on a different machine, by copying the Brewfile there and calling

    brew bundle install

This is superior to the Apple app store, because 1/ no need to be logged in into your apple id and 2/ it's all done via the command line interface, which means it is much faster to do for a lot of apps and you can make it part of automations easily.

## Installing and managing GUI applications

Homebrew can also manage applications with graphical user interfaces with the help of the cask option[^3].

    brew install --cask tor-browser

This works for all sorts of apps (like zoom, dropbox, or chrome that not just developers use every day). Apps installed like this get picked up by the bundle commands as well.
To get these updated, you can use cask-upgrade[^4]:

    brew tap buo/cask-upgrade

to install and the following command to update all GUI applications to their latest version:

    brew cu

[^1]: https://brew.sh/
[^2]: https://github.com/Homebrew/homebrew-bundle
[^3]: https://github.com/Homebrew/homebrew-cask
[^4]: https://github.com/buo/homebrew-cask-upgrade
