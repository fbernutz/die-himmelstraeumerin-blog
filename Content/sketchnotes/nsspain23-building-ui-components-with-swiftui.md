---
date: 2023-09-14 13:00
description: Sketchnote of NSSpain 2023 talk by Kasper about how to build a custom swipe action with SwiftUI
tags: nsspain, nsspain-23, iOS, UI, component-library, swiftui
image: images/sketchnotes/nsspain23-building-ui-components-with-swiftui-small.jpg
sketchnoteMetadata.contentCreator: Kasper Lahti
sketchnoteMetadata.linkToContentCreator: https://mastodon.social/@kasperl
title: NSSpain 2023: Building UI components with SwiftUI
---

## Detailed image description of the sketchnote

- Let's talk about swipe actions
- the keyboard shortout for phones
- How do they work?
- Lots of built-in functionality...

### Custom component

- Custom swipe action has to support a lot... lots of code that can break with iOS updates
- should work for everyone: accessibility

### 1. Gestures

- should be cancellable
- priority over buttons
- take velocity into account 
- remember Right-To-Left layout
- don't interfer with scrolling

### 2. Actions

- support full swipe to interact with actions
- different action roles / styles

### 3. Behaviors

- only one "open" swipe action at a time

### 4. Styling 

- similar All to Button styles
- animation
- layout
- show information instead of actions
