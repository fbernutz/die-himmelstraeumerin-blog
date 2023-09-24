---
date: 2023-09-14 16:15
description: Sketchnote of NSSpain 2023 talk by Benedikt about using Rust to share code with multiple platforms
tags: nsspain, nsspain-23, mobile, multiplatform, kotlin-multiplatform, kotlin-native, flutter, react-native, rust, swift
image: images/sketchnotes/nsspain23-different-approaches-to-share-code-small.jpg
sketchnoteMetadata.contentCreator: Benedikt Terhechte
sketchnoteMetadata.linkToContentCreator: https://twitter.com/terhechte
title: NSSpain 2023: An overview of different approaches to share code across platforms
---

## Detailed image description of the sketchnote

- Native UI? or customizable native flows?
- only UI layer is written in native code and controller, model, libraries are shared code

- Dackel Dackel Go
- Do you want an Android арp? Look at population first or you could just write it twice?

### Options

- Futter
- React Native (for simple apps or demos)
- Kotlin Native
- Swift
- C
- Rust

### Rust

- very similar to Swift
- not written for a specific platform

### Uniffi

- generates libs for different platforms

Rust works! We're using it!
