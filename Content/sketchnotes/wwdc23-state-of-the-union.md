---
date: 2023-06-06 15:37
description: Sketchnote of WWDC 2023 State of the Union with details about news in Swift, SwiftUI, APIs and frameworks
tags: apple, wwdc, wwdc-23, iOS, online-conference, swift, iPadOS, watchOS, macOS
image: images/sketchnotes/wwdc23-state-of-the-union-small.jpg
title: WWDC 2023: Platforms State of the Union
---

Watch [Session #102](https://developer.apple.com/wwdc23/102) for more details.

## Detailed image description of the sketchnote

Great platform lead to great apps:
* language 
* frameworks
* tools 
* services

### Swift

* Swift Macros (@ or #), e.g. #URL with validation or @AddAsync, Sharable through Swift Packages
* Swift-C++ interoperability

### 4 new app experiences improved

* WidgetKit: improved previews, timeline in Xcode
* App Intents
* TipKit 
* AirDrop: Share Link

### Gaming

* Game Mode in macOS Sonoma
* New game porting toolkit
* New Metal debugger tools

### WatchOS 10

* pagination focus
* new features for free when app is built with new SDK
* new custom workout API to share fitness plans
* new CoreMotion API

### SwiftUI

* improved animation APIs, e.g. Animation Phase and full support for key framing
* simplified data flow, with @Observable macro

### Camera

* zero shutter lag
* volume shutter buttons
* ISO HDR API
* ScreenCaptureKit
* Camera on tvOS

### Values

Accessibility:

* Pause animated images
* Dim Flashing Lights

Privacy:

* calendar add only permission
* Sensitive Content Analysis 
* Privacy manifest
* New Subscription Store view

### Swift Data

New SwiftData for data management.

* persistence
* undo Redo
* iCloud sync
* Spotlight search
* privacy manifest

```swift
@Model
class Bird {
    @Attribute (.unique) var name
    // ...
}
```

* @Query

### Tools

* improved auto completion
* generate symbols for asset catalog, e.g. `Image(.sun)`
* new test report UI

### visionOS

* Shared Space
* window
* volume
* or Full Space
* ARKit, RealityKit, SwiftUI + UIKit
* Developer tools are updated: Reality Composer Pro
