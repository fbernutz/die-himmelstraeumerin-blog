---
date: 2023-09-13 12:30
description: Sketchnote of SwiftUI animation workshop by Pavel at NSSpain 2023
tags: nsspain, nsspain-23, iOS, swiftui, animations
image: images/sketchnotes/nsspain23-swiftui-animations-small.jpg
sketchnoteMetadata.contentCreator: Pavel Zak
sketchnoteMetadata.linkToContentCreator: https://twitter.com/myridiphis
title: NSSpain 2023: SwiftUI animations - Chef's Secrets (workshop)
---

## Detailed image description of the sketchnote

### Move Objects

```swift
onTapGesture {
    withAnimation(.) {
        self.moveBall()
    }
}
```
vs 
```swift
BallView()
    .animation
```

- The second example will run every time the view is rendered
- `Animatable` protocol magic
- `AnimatablePair(A, B)` can also nest pairs

### Vectors

- `AnimatableVector: Vector Arithmetic {}`
- Interpolation is the magic!

### Non linear motion

- Normalize valves to make visualization easier (0..1)
- `.repeatForever``

### Shapes

- Example: Gummy slider or Water tank
- Override path functions
- Always a rectangle but draw the orange bubble

### Morphing

- But remember your starting points of each shape
- The more points you have, the smoother it ho rocket will look
- No rocket science, only 86 lines of code

### View Modifier

- Particle Effect

### Whipping

- Example: Hamburger to close button
- `delay(...)` for effects of more natural motion (only use it with purpose)
- Use blur and blend Modes for making animations
- Reuse modifier on muttiple views
- Watch out for performance!
- Use sane number of views

### New In iOS17

- Add completion to animation
- New phase animator
