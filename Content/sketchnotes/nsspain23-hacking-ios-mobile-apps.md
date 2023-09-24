---
date: 2023-09-14 11:50
description: Sketchnote of NSSpain 2023 talk by Kamil about how to hack an iOS mobile app and what not to do
tags: nsspain, nsspain-23, iOS, objective-c
image: images/sketchnotes/nsspain23-hacking-ios-mobile-apps-small.jpg
sketchnoteMetadata.contentCreator: Kamil Borzym
sketchnoteMetadata.linkToContentCreator: https://pl.linkedin.com/in/kamil-borzym-03763473
title: NSSpain 2023: Hacking iOS Mobile Apps
---

## Detailed image description of the sketchnote

- Don't do that at home, kids!

### Bad Developers

- code review with code far right... nobody scrolled
- Solarwinds
- Xcode Ghost

### Bad Third Party Code

- maliscious code in unused library & Obi-C runtime...

### Hacking Time

- Swizzling
- Listen to user input
- WebKit & WKWebView
- "Are we safe? Yes? ... No
- UIWebView uses same app runtime

### Hacking Time II

- Let's write some Javascript code!
- Test the webview
- we can still listen!
- Is SFSafariVC the solution? No JS allowed

### WHat now?

- check 3rd party code with hashes?
- detect swizzling?
- SFSafariVC?
- seperate processes?

My goal was to make you worry! He he 
