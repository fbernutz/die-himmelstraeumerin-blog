---
date: 2021-03-15 15:30
description: After a few technical interviews, I realised that it's good to prepare for them (who would've thought) 😅 Although I knew what the questions were about, I found it difficult to talk about details and explain some topics spontaneously. To be less freaked out when an interviewer asks me about capture lists or memory management in Swift, I wanted to make some sketchnotes on possible interview topics. I'm learning some of these topics anyway, so sketchnotes would be perfect as a summary (at least for me). And if they help me, maybe they'll help you too.
tags: post, iOS, interview
image: images/summaries-ios-interview-topics/preview.jpg
---

# Summaries of (some possible) iOS Interview Topics

After a few technical interviews, I realised that it's good to prepare for them (who would've thought) 😅 Although I knew what the questions were about, I found it difficult to talk about details and explain some topics spontaneously. To be less freaked out when an interviewer asks me about capture lists or memory management in Swift, I wanted to make some sketchnotes on possible interview topics. I'm learning some of these topics anyway, so sketchnotes would be perfect as a summary (at least for me). And if they help me, maybe they'll help you too.

**Disclaimer 1:** The list of topics isn't exhaustive. I have no idea what your interviewers will ask you about in your interviews. But this is an overview about the (in my opinion) most common topics.

**Disclaimer 2:** There are much better and more detailed sources to learn about the details. These are just "small" summaries about the most important points _for me_. There might be other important points for you.

## Topics

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">I&#39;m thinking of creating a small series of <a href="https://twitter.com/hashtag/sketchnotes?src=hash&amp;ref_src=twsrc%5Etfw">#sketchnotes</a> that explains/summarizes some topics for iOS job interviews. <br><br>Currently, I have on my list:<br>- Swift Evolution<br>- Structs vs Classes<br>- Closures<br>- Generics<br>- Sets<br><br>In which topics would you be interested? 🤔 <a href="https://twitter.com/hashtag/ios?src=hash&amp;ref_src=twsrc%5Etfw">#ios</a> <a href="https://twitter.com/hashtag/iosdev?src=hash&amp;ref_src=twsrc%5Etfw">#iosdev</a></p>&mdash; diehimmelstraeumerin (@felibe444) <a href="https://twitter.com/felibe444/status/1369972198685949954?ref_src=twsrc%5Etfw">March 11, 2021</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

On my list are currently the following topics: 

- Swift Evolution (done ✅)
- Structs vs Classes (done ✅)
- Sets
- Concurrency / Dispatch Queues
- Grand Central Dispatch / NSOperations
- Protocol / Delegate Pattern
- Notification / Observer
- Closures
- Generics
- Core Graphics
- Extensions
- UIKit Constraints / AutoLayout
- Storyboard vs layout-in-code
- SwiftUI Data Flow

I won't create sketchnotes for every topic, but I think it's good to have a list of relevant topics that you can study or prepare for your interviews.

Now, I'll walk you through the sketchnotes I have created as part of my preparation and add some additional links to them for your further studies. There will be more sketchnotes in the next days/weeks. 

## Swift Evolution

_(added on 15th of March 2021)_

Let's start with the evolution of Swift. I started working with iOS when Swift 2 was the latest release - it was in 2015.

Creating this sketchnote was especially fun because I could look back at the features which were added step by step. I had almost forgotten that there was a time when Swift had no `guard` statement or `try and catch`. I don't miss it 😉

<a href="../../images/summaries-ios-interview-topics/swift-evolution.jpg" target="_blank">
    <img src="../../images/summaries-ios-interview-topics/swift-evolution.jpg" alt="Sketchnote about the evolution of Swift displayed with a timeline and additional release notes." />
</a>

### Additional links

- The History of Swift [on Wikipedia][wikipedia]
- I can recommend all "What's new in Swift..." articles by [Paul Hudson](https://twitter.com/twostraws) where the most important changes for each Swift version are explained. You can find them on [Hacking With Swift](www.hackingwithswift.com).

## Structs vs Classes

_(added on 16th of March 2021)_

"Structs vs Classes" is a real classic. 

It was a bit difficult to focus on the most important things here. I have two more pages of notes about capture lists and memory management in Swift. Maybe I add both topics to the list and make own sketchnotes for them or I can combine the topics with another topic. Let's see. 

So, this sketchnote contains (in my opinion) the most important differences between Structs and Classes in Swift, with some additional thoughts and a small chart about when (and why) to use an Enum, a Struct or a Class.

<a href="../../images/summaries-ios-interview-topics/structs-vs-classes.jpg" target="_blank">
    <img src="../../images/summaries-ios-interview-topics/structs-vs-classes.jpg" alt="Sketchnote about the differences between structs and classes in Swift." />
</a>

### Additional links

- [Choosing Between Structures and Classes](https://developer.apple.com/documentation/swift/choosing_between_structures_and_classes) from  Docs
- [Capture Lists](https://scotteg.github.io/capture-lists) by Scott Gardner
- I love this [gif with the two cups of coffee](https://twitter.com/suksr/status/738130336270422017) to visualize reference and value types
- In Depth Optimization Tip: [Use copy-on-write semantics for large values](https://github.com/apple/swift/blob/main/docs/OptimizationTips.rst#advice-use-copy-on-write-semantics-for-large-values)

## Stay Tuned

More sketchnotes will follow the next days!

[wikipedia]: https://en.wikipedia.org/wiki/Swift_(programming_language)#History
