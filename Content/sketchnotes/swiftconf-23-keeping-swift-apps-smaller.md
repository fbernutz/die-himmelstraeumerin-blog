---
date: 2024-03-15 14:15
description: Sketchnote about how to keep Swift apps small from Swift Conf 2023
tags: iOS, app-size, swift
image: images/sketchnotes/swiftconf-23-keeping-swift-apps-smaller-small.jpg
sketchnoteMetadata.contentCreator: Bruno Rocha
sketchnoteMetadata.linkToContentCreator: https://twitter.com/rockbruno_
title: Swift Conf 2023: Keeping Swift Apps small
---

## 1. Why do we care?

- In the 90s: high optimizations
- Today: great experiences! But really?
- Developed vs emerging markets
- 85% of the population care about app size
- Install size != download size

## 2. How do we track it?

- App Size CI Checks like Emerge give you the power to block changes like + 12.4 MB
- Policies & Guidelines

## 3. How do we improve it?

- Delete everything hehe

Resources:
- SVG for small icons
- HEIC for the rest
- Minimize JSON
- Audio CAF + AAC
- Use Asset Catalog

Swift:
- Improper usage of Structs, like nesting types is expensive, reference types in structs, mutability in Structs
- Unused code: unnessesary dynamic dispatch, only add protocols to structs if needed

- Start Simple
