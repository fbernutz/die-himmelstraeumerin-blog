---
date: 2024-10-30 15:30
description: Sketchnote of a talk at Pragma Conference 2024 about sendable.
tags: pragma, iOS, sendable, swift
image: images/sketchnotes/pragma24-deep-dive-into-sendable-small.jpg
sketchnoteMetadata.contentCreator: Tim Condon
sketchnoteMetadata.linkToContentCreator: https://bsky.app/profile/0xtim.bsky.social
title: Pragma Conference 2024: A deep dive into Sendable
---

## Detailed image description of the sketchnote

Swift Safety

- Optionals
- Memory overflows
- Explicit Error Handling
- Type checking

... to stop undefined behavior.

- Sendable checks for data races at compile time.
- `@Sendable` for closures
- Sendable in Reference Types?
   - `@MainActor`
   - actor
   - manual synch with locks `@unchecked sendable` (use with caution)
- `nonisolated (unsafe)` (use with caution)
- Just because you don't get emors, doesn't mean your app is safe..
- `func addPerson(_ person: sending Person)`
- sendable ＝= thread safety
- lots of Swift Evolutions in GitHub
- `@preconcurrency` for backwards compability
