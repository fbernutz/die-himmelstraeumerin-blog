---
date: 2023-09-15 17:05
description: Sketchnote of NSSpain 2023 talk by Oswaldo and Juantri about how to move from CocoaPods to SwiftPM
tags: nsspain, nsspain-23, iOS, package-manager, swift-packages
image: images/sketchnotes/nsspain23-moving-from-cocoapods-to-swiftpm-small.jpg
sketchnoteMetadata.contentCreator: Oswaldo Rubio Fung & Juan Trinidad Jimenez Armesto
sketchnoteMetadata.linkToContentCreator: https://twitter.com/RubioFung
title: NSSpain 2023: Moving from CocoaPods to SwiftPM: Our Journey
---

## Detailed image description of the sketchnote

### Reasons

1. Reduce tech dept
2. More flexibility
3. Improve dev experience

### Problem

- over 20 dependencies per module
- 30% mixed ObjC code

### The roadmap

- create migration plan
- document
- estimate time

- Pack 3rd party dependencies in separate package
- Reduce complexity
- "Jungle" to calculate complexity

### The migration

```swift
#if SWIFT_PACKAGE 
    import xx
#else
    import xy 
#endif
```

- package access modifier
- XING
    - dependencies
    - libraries
    - testing
    - UILibraries
