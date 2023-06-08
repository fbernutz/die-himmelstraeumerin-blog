---
date: 2023-06-08 20:29
description: Sketchnote of WWDC 2023 talk about how to build accessible apps with Swift and SwiftUI and additions and enhancements in APIs.
tags: apple, wwdc, wwdc-23, iOS, online-conference, swift, swiftui, uikit, accessibility
image: images/sketchnotes/wwdc23-build-accessible-apps-with-swiftui-and-uikit-small.jpg
sketchnoteMetadata.contentCreator: Allison Lettiere
title: WWDC 2023: Build Accessible Apps with SwiftUI and UIKit
---

Watch [Session #10036](https://developer.apple.com/videos/play/wwdc2023/10036) for more details.

## Detailed image description of the sketchnote

### Toggle

* new trait `.isToggle` in SwiftUI or `.toggleButton` in UIKit for custom components
* A button with "Filter" would be announced for VoiceOver with "Filter, Switch Button, Double-tap to toggle setting"

### Accessibility Notification – Announcement priority:

* High: can interrupt, can't be interrupted
* Default: can interrupt, can be interrupted
* Low: can't interrupt, can be interrupted

### Zoom Action modifier in SwiftUI

* `.supportsZoom` trait in UIKit & override functions

### Direct Touch options 

* `.allowsDirectInteraction` trait
* silent on touch
* requires activation

### Content Shape Kind in SwiftUI

* `.contentShape(.accessibility, Circle())`

### Block based attribute setters in UIKit 

* to keep attributes up-to-date
* `view.accessibilityValueBlock = {...}`
