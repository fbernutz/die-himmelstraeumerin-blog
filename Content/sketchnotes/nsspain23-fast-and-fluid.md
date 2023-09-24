---
date: 2023-09-15 12:25
description: Sketchnote of NSSpain 2023 talk by Gui about an app's perceived performance and how to improve it
tags: nsspain, nsspain-23, iOS, UI, UX, mobile
image: images/sketchnotes/nsspain23-fast-and-fluid-small.jpg
sketchnoteMetadata.contentCreator: Guilherme Rambo
sketchnoteMetadata.linkToContentCreator: https://rambo.codes/
title: NSSpain 2023: Fast and Fluid
---

## Detailed image description of the sketchnote

- This is not about performance... but loading spinners!
- Pawtraits: Instagram for Gui's dog Yoshi!
- Not all loading states need to be shown

### Deferred Loading 

- ~200ms
- transition between states gives you more time

- An app's fluidity is the difference between its actual performance and the perceived performance.
- Show placeholder content instead of activity indicators

### Error Loading

- tricky... revert to previous state?

### Deferred Navigation

- loading detail information
- introduce an intentional Lag

### TIPS

- prevent unintentional animation
- no boring placeholders
