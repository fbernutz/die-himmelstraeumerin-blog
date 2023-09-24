---
date: 2023-09-14 17:25
description: Sketchnote of NSSpain 2023 talk by Araks about how to modularize a monolith and legacy code base
tags: nsspain, nsspain-23, iOS, objective-c, swift, architecture
image: images/sketchnotes/nsspain23-modularising-a-monolith-small.jpg
sketchnoteMetadata.contentCreator: Araks Avoyan
sketchnoteMetadata.linkToContentCreator: https://twitter.com/AraksAvoyan
title: NSSpain 2023: Modularising a monolith!
---

## Detailed image description of the sketchnote

- since 2012 LoginVC as M(assive)VC in Objective-C

### Legacy Code

- no piece by piece migration possible 
- no big bang change possible either

### Ownership

- Alignment needed

### Responsibility

1. Authentication 
2. Session State

### Lessons Learned
- Brainstorming & drawing diagrams helps
- A/B testing
- no major incidents

### The end result

- manageable modules
- flexibility
- migrated to Swift
- ObjC 40k vs Sift 27k lines of code 
