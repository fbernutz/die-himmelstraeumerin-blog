---
date: 2023-06-07 20:29
description: Sketchnote of WWDC 2023 talk about how to perform accessibility audits for your app.
tags: apple, wwdc, wwdc-23, iOS, online-conference, swift, accessibility, testing
image: images/sketchnotes/wwdc23-perform-accessibility-audits-small.jpg
sketchnoteMetadata.contentCreator: Bhavya Garg
title: WWDC 2023: Perform accessibility audits for your app
---

Watch [Session #10035](https://developer.apple.com/videos/play/wwdc2023/10035) for more details.

## Detailed image description of the sketchnote

* High quality means the app is accessible for everyone!
* Write tests to catch bugs before they are shipped

### Accessibility Inspector

* find
* diagnose
* fix accessibility issues
* perform manual audits for views

Now this is automatable.

``` swift
func testAccessibility() throws {
    let app = XCUlApplication()
    app.launch()
    try app.performAccessibilityAudit()
}
```

### New Audit API

* Option to filter issues that are false-positive
* Option to test specific categories, like Dynamic Type, Contrast and more

### New API

* `.automationElements` to make elements accessible in UITests
