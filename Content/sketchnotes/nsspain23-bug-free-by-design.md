---
date: 2023-09-14 15:05
description: Sketchnote of NSSpain 2023 talk by Marina about how to use the compiler to prevent bugs
tags: nsspain, nsspain-23, iOS, swift
image: images/sketchnotes/nsspain23-bug-free-by-design-small.jpg
sketchnoteMetadata.contentCreator: Marina Vatmakhter
sketchnoteMetadata.linkToContentCreator: https://twitter.com/hybridcattt
title: NSSpain 2023: Bug-Free by Design - Crafting Swift Code That Doesn't Sting
---

## Detailed image description of the sketchnote

### What is good code?

- Readable
- Maintainable
- Testable
- Nice to look at
- Correct
- Robust
- Performant
- Serves better UX

"Best code is code you don't write!" True.

### Defer

- `defer {...}``
- Always called at "end' of finction
- cleanup code
- end tasks
- close files

We love compilertime checks!

### Consistent UI updates

- show/hide activity loader us data vs error
- use enums
- use late lets to find bugs

### Safer assets

- use enums
- have test for all assets & conform to `CaseIterable`

### Safer identifiers 

- use typealiases instead of strings directly
- makes them easier to find
- separate types
- safer API

### Refactoring with the compiler

- use optional instead of -1 
- use `private (set)`
