---
date: 2021-03-15 15:30
description: After my first technical interviews in years, I have found that it's always a good idea to refresh your knowledge and prepare for technical interview questions (who would've thought) 😅 Although I knew what the questions were about, I found it difficult to talk about details and explain topics spontaneously. To be less freaked out when an interviewer asks me about capture lists or memory management in Swift, I wanted to make some sketchnotes on possible interview topics. They would be perfect as a summary. And if they help me, maybe they'll help you too.
tags: iOS, interview-topics
image: images/summaries-ios-interview-topics/preview.jpg
---

# Sketchnote Summaries of possible iOS Interview Topics

After my first technical interviews in years, I have found that it's always a good idea to refresh your knowledge and prepare for technical interview questions (who would've thought) 😅 Although I knew what the questions were about, I found it difficult to talk about details and explain topics spontaneously. To be less freaked out when an interviewer asks me about capture lists or memory management in Swift, I wanted to make some sketchnotes on possible interview topics. They would be perfect as a summary. And if they help me, maybe they'll help you too.

<figure>
    <img src="../../images/summaries-ios-interview-topics/preview.jpg" alt="iPad which displays a Sketchnote in ProCreate with some hand written notes next to it." />
    <figcaption>I make the sketchnotes with Procreate after researching the content and making handwritten notes.</figcaption>
</figure>

## Topics

[I asked on twitter for possible interview topics](https://twitter.com/felibe444/status/1369972198685949954?s=20). On my list are currently the following: 

- [Swift Evolution](#swift-evolution) (done ✅)
- [Structs vs Classes](#structs-vs-classes) (done ✅)
- [Sets](#sets) (done ✅)
- [Grand Central Dispatch / Concurrency / OperationQueue](#gcd) (done ✅)
- [Generics](#generics) (done ✅)
- Protocol / Delegate Pattern
- Notification / Observer
- Closures
- Core Graphics
- Extensions
- UIKit Constraints / AutoLayout
- Storyboard vs layout-in-code
- SwiftUI Data Flow
- Memory Management with ARC (especially to values returned by functions??)

_Disclaimer: The list of topics isn't exhaustive. I have no idea what your interviewers will ask you about in your interviews. But this is an overview about the most common topics. (More iOS Interview Questions at [GitHub by raywenderlich.com](https://github.com/raywenderlich/ios-interview/tree/master/iOS%20Specific%20Questions))_

Now, I'll walk you through the sketchnotes I have created as part of my preparation and add some additional links to them for your further studies. There will be more sketchnotes in the next days/weeks. But I won't have time to create sketchnotes for every single topic.

<h2 id="swift-evolution">Swift Evolution</h2>

_(added on 15th of March 2021)_

Let's start with the evolution of Swift. I started with iOS development shortly before the release of Swift 2 – it was in 2015.

Creating this sketchnote was especially fun because I could look back at the features which were added step by step. I had almost forgotten that there was a time when Swift had no `guard` statement or `try and catch`. I don't miss it 😉

<a href="../../images/summaries-ios-interview-topics/swift-evolution.jpg" target="_blank">
    <img src="../../images/summaries-ios-interview-topics/swift-evolution-medium.jpg" alt="Sketchnote about the evolution of Swift displayed with a timeline and additional release notes." />
</a>

### Additional links

- 🔎 See [this sketchnote in full resolution](https://fbernutz.github.io/images/summaries-ios-interview-topics/swift-evolution.jpg)
- The History of Swift [on Wikipedia][wikipedia]
- I can recommend all "What's new in Swift..." articles by [Paul Hudson](https://twitter.com/twostraws) where the most important changes for each Swift version are explained. You can find them on [Hacking With Swift](www.hackingwithswift.com).

<h2 id="structs-vs-classes">Structs vs Classes</h2>

_(added on 16th of March 2021)_

"Structs vs Classes" is a real classic in interviews. 

It was a bit difficult to focus on the most important things here. I have two more pages of notes about capture lists and memory management in Swift. Maybe I add both topics to the list and make own sketchnotes for them or I can combine the topics with another topic. Let's see. 

So, this sketchnote contains (in my opinion) the most important differences between Structs and Classes in Swift, with some additional thoughts and a small chart about when (and why) to use an Enum, a Struct or a Class.

<a href="../../images/summaries-ios-interview-topics/structs-vs-classes.jpg" target="_blank">
    <img src="../../images/summaries-ios-interview-topics/structs-vs-classes-medium.jpg" alt="Sketchnote about the differences between structs and classes in Swift." />
</a>

### Additional links

- 🔎 See [this sketchnote in full resolution](https://fbernutz.github.io/images/summaries-ios-interview-topics/structs-vs-classes.jpg)
- [Choosing Between Structures and Classes](https://developer.apple.com/documentation/swift/choosing_between_structures_and_classes) from  Docs
- Swift Docs: [Classes and Structs](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)
- [Capture Lists](https://scotteg.github.io/capture-lists) by Scott Gardner
- I love this [gif with the two cups of coffee](https://twitter.com/suksr/status/738130336270422017) to visualize reference and value types
- In Depth Optimization Tip: [Use copy-on-write semantics for large values](https://github.com/apple/swift/blob/main/docs/OptimizationTips.rst#advice-use-copy-on-write-semantics-for-large-values)

<h2 id="sets">Sets</h2>

_(added on 17th of March 2021)_

I know Sets can be really powerful, but I always forget how the set operations are called and what they mean. That's the reason why "How to use Sets" was a topic from which I always wanted to make a sketchnote to have a quick reference.

<a href="../../images/summaries-ios-interview-topics/sets.jpg" target="_blank">
    <img src="../../images/summaries-ios-interview-topics/sets-medium.jpg" alt="Sketchnote about how to use Sets in Swift. It contains set operations, membership and differences to an Array. Sets are unordered, only contain unique values, must be hashable and have an efficient lookup in large collections." />
</a>

### Additional links

- 🔎 See [this sketchnote in full resolution](https://fbernutz.github.io/images/summaries-ios-interview-topics/sets.jpg)
- Swift Docs: [Collection Types](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html), section about Sets
- [When to use a set rather than an array](https://www.hackingwithswift.com/example-code/language/when-to-use-a-set-rather-than-an-array) on Hacking With Swift

<h2 id="gcd">Grand Central Dispatch / Concurrency / OperationQueue</h2>

_(added on 18th of March 2021)_

Puuuh, creating this sketchnote was really time-consuming and exhausting. There's a lot going on in it, but I tried to make containers to group content and connect it with arrows when needed. It's just a huge topic, or rather it's a lot of topics that have to do with each other! 

Do you know the difference between threads and queues? Well, to be honest, it wasn't clear to me before I made the sketchnote. So, I'm glad I learned something new!

<a href="../../images/summaries-ios-interview-topics/gcd.jpg" target="_blank">
    <img src="../../images/summaries-ios-interview-topics/gcd-medium.jpg" alt="Sketchnote about Grand Central Dispatch, threads, concurrency, types of queues, Operation Queues and DispatchGroup." />
</a>

### Additional links

- 🔎 See [this sketchnote in full resolution](https://fbernutz.github.io/images/summaries-ios-interview-topics/gcd.jpg)
- [Dispatch Framework](https://developer.apple.com/documentation/dispatch) from  Docs
- [Operation Queue](https://developer.apple.com/documentation/foundation/operationqueue) from  Docs
- [How to make one operation wait for another to complete using addDependency()](https://www.hackingwithswift.com/example-code/system/how-to-make-one-operation-wait-for-another-to-complete-using-adddependency) on Hacking With Swift
- [Project 9: Grand Central Dispatch](https://www.hackingwithswift.com/read/9/overview) on Hacking With Swift
- [Threads, Queues, and Concurrency](https://cocoacasts.com/swift-and-cocoa-fundamentals-threads-queues-and-concurrency) on Cocoacast
- [Grand Central Dispatch](https://www.swiftbysundell.com/basics/grand-central-dispatch/) on Swift by Sundell
- [Swift Evolution Proposal about "Actors"](https://github.com/apple/swift-evolution/blob/main/proposals/0306-actors.md)
- [UIKonf 2020: The Multi-Threaded Asynchronous Parallel World of Swift](https://www.youtube.com/watch?v=MqqMmt1pMIc) by Leo Dion

<h2 id="generics">Generics</h2>

_(added on 26th of March 2021)_

Generics are an _abstract_ way to solve code duplication. I think the "abstraction" might be one reason why I sometimes have trouble understanding generic code. Even though generics can make the code more flexible and reusable, remember that it _can_ also make the code harder for others to understand.

<a href="../../images/summaries-ios-interview-topics/generics.jpg" target="_blank">
    <img src="../../images/summaries-ios-interview-topics/generics-medium.jpg" alt="Sketchnote about Generics and how to use them in Swift, in detail about naming conventions, type constraints and code examples." />
</a>

### Additional links

- 🔎 See [this sketchnote in full resolution](https://fbernutz.github.io/images/summaries-ios-interview-topics/generics.jpg)
- Swift Docs: [Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [What are generics?](https://www.hackingwithswift.com/example-code/language/what-are-generics) on Hacking With Swift

## Stay Tuned

More sketchnotes will follow the next days!

[wikipedia]: https://en.wikipedia.org/wiki/Swift_(programming_language)#History
