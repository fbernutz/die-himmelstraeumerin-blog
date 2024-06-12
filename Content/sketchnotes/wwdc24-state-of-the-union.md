---
date: 2024-06-11 18:32
description: Sketchnote of WWDC 2024 State of the union with details about news in iOS 18, iPadOS 18, watchOS 11, Swift, SwiftUI, APIs and frameworks
tags: apple, wwdc, wwdc-24, iOS, online-conference, swift, iPadOS, watchOS, macOS, ai, apple-intelligence
image: images/sketchnotes/wwdc24-state-of-the-union-small.jpg
title: WWDC 2024: Platforms State of the Union
---

Watch [Session #102](https://developer.apple.com/videos/play/wwdc2024/102) for more details.

## Detailed image description of the sketchnote

### Apple Intelligence

- for iOS, iPadOS, macOS
- on-device Foundation model with focus on specialization, size, performance
- Private Cloud Compu for larger models

Writing Tools:

- just works for text views 
- new delegate functions

Genmoji:

- `supportsAdaptiveImageGlyph = true`
- Attributed String 

Image Playground:

- images generated on-device

Siri:

- new Spotlight API
- personal context understanding
- enhanced App Intents 
- enhanced conversations

### RealityKit 4

- Reality Composer Pro for visionOS, macOS, i0S, iPadOS
- better debugging in Xcode

### Xcode 16

- Code Completion with ML with comments for context
- use natural language with Swift Assist
- knows Apple's latest SDKs and Swift language features
- never stored on server
- only used for your requests
- not used to train models
- unified thread backtrace view

### Swift 6 

- 10 years
- Swift is the best choice to succeed C++
- invested in Visval Studio Code support
- expand Linux & Windows support
- new GitHub organization 
- data race safety
- diagnose issues at compile time
- 5.5: async/await
- 5.6: structured concurrency
- 5.7: actors
- 6.0: data race safety (opt-in)
- Swift Testing:

```
@Test
func continent() {
   #require(...)
   #expect(...）
}
```

- flexible tagging system → rich inline presentation for failed tests

### SwiftUI

Xcode Previews:

- new dynamic linking architecture
- `@Previewable` macro for states

Customization:

- custom hover effects 
- new text renderer All for effects & animations

Swift Data:

- new modelling: `#Index`, `#Unique`

### iOS 18

Controls:

- toggle, action or deep link 
- new controls in Control Gallery or Lockscreen
- Locked Camera Capture framework

Homescreen:

- app icons and widgets can be tinted, light or dark 
- Passkey: Registration API

### iPadOS 18

- redesigned floating tabbar → turns into sidebar
- refined animations

### watchOS 11

- Live Activities
- interactive widgets
- Accessory WidgetGroup layout
- Hand gesture shortcut for double tap

### macOS

- support for Apple Intelligence 
- more games with Game Porting Toolkit 2
- debug and profile source of HLSL shaders

### visionOS 2

- SwiftUI, RealityKit & ARKit as foundation
- resize volumes
- TabletopKit
- Room Anchors

Integrating deeply with the platform means making your app available in more places. 
"The best apps use native SDKs."
