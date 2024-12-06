---
date: 2024-11-14 17:30
description: Sketchnote of a talk at Do iOS Conference 2024 about how to savely ship your app on a Friday.
tags: conference, doiOS-24, iOS, release
image: images/sketchnotes/doios24-ship-your-app-on-a-friday-small.jpg
sketchnoteMetadata.contentCreator: Pol Piella
sketchnoteMetadata.linkToContentCreator: https://bsky.app/profile/polpielladev.bsky.social
title: Do iOS Conference 2024: Ship your app on a friday and enjoy your weekend
---

## Detailed image description of the sketchnote

- "Mobile releases are difficult! So do not release on Fridays! Right??"

### External factors 

- ~14 hours process
- stuck in reviews or rejected
- users opt-out off automatic updates

### How to gain confidence?

1. Automate as much as possible
- Code freeze on release branch
- Build, archive, sign and upload with fastlane and Github Actions
- Have a cmprehensive test suite + run them

2. Test your release pipeline to catch random upload issues
3. Adopt a release strategy (do not release too often... with minor updates)
4. Use feature toggles to turn features off
6. Don't release to all users at once, use a phased rollout to pause rollouts
7. Move risky logic to the server for faster updates
