---
date: 2024-11-14 10:30
description: Sketchnote of a talk at Do iOS Conference 2024 about how to improve performance for your app with instruments.
tags: conference, doiOS-24, iOS, performance, instruments
image: images/sketchnotes/doios24-making-apps-faster-small.jpg
sketchnoteMetadata.contentCreator: Samuel Goodwin
title: Do iOS Conference 2024: Making apps faster with tools you get for free
---

## Detailed image description of the sketchnote

- "Simulate Memory warning" in simulator
- Hide System Libraries to filter out info that we can't optimize
- Invert Call Tree to show deepest info first
- SwiftUI's body should be quick because it's called often
- Check how different threads are used

### The Game Plan

1. Find what's slow
2. Make it faster
