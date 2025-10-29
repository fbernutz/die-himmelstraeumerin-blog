---
date: 2025-10-07 17:05
description: Sketchnote titled "Don’t Let Time Zones Ruin Your Day(s)" by Chris Wu. It features humorous insights on time zones, including notes on calendar issues, UTC offsets, and potential pitfalls.
tags: swiftleeds, swiftleeds-25, time-zones, date, swift, conference
image: images/sketchnotes/swiftleeds25-dont-let-time-zones-ruin-your-days-small.jpg
sketchnoteMetadata.contentCreator: Chris Wu
sketchnoteMetadata.linkToContentCreator: https://mastodon.social/@MuseumShuffle
title: Don’t Let Time Zones Ruin Your Day(s)
---

## Detailed image description of the sketchnote

- Days since last timezone issues -1

### About Please Don’t Rain app

- Please don’t rain when I want to go to the theme park
- Weather for a different place
- Track time until x

### Options

- TimestampSince1970
- Calendar 
- Date formats 
- Format style

- [Calendric Fallacy](https://yourcalendricalfallacyis.com/) website shout out
- UTC offsets can contain minutes! (Lord Howe Island)
- Watch out: "Problems can be subtle"
- `Calendar.current` (timezone from device settings) -> solution: hardcode calendar with custom timezone and custom FormatStyle
- Assume nothing
- Test everything
- Timezones are a nightmare
