---
date: 2019-05-16 09:00
description: Is it really important to build mobile apps with accessibility features and who needs them? Deep down, everyone of us knows that when we don’t support accessibility features in our products, we leave users behind. But in reality, we all find tons of excuses for not going that extra mile …
tags: post, accessibility, iOS
---

# Building Apps for Everyone?!

Deep down, everyone of us knows that when we don’t support accessibility features in our products, we leave users behind. But in reality, we all find tons of excuses for not going that extra mile …

When you add new features to your app, nobody will test accessibility features (I really hope there are some exceptions out there). You don’t even get the time and money to implement these features. So, at some point, you as a developer, simply don’t think about it anymore.

---

## A few weeks ago, I had a key experience.

My mom is visually and motor impaired and she got her _first_ smartphone (Hallo Mama 👋). I never even imagined that this could be a thing for her, but one day, she just called a friend and went out to buy a used Android smartphone. She asked me for help to set everything up, install some apps, and explain some things here and there.

I observed closely how she interacted with her new phone. It was nearly impossible for her to type in her personal information to create a Google account, because her fine motor skills were too weak. The difficulties she had using the smartphone really blew my mind.

The first thing we did, was to scale up the system font size, and we realized that even the Android system itself is not fully optimized for accessibility.

<table>
    <tr>
        <figure>
            <td>
                <figure>
                    <img 
                    src="../../images/building-apps-for-everyone/example1.JPG" 
                    alt="Screenshot of an Android Smartphone where the font size is enlarged and half of the text is not readable because it's trimmed">
                </figure>
            </td>
            <td>
                <figure>
                    <img src="../../images/building-apps-for-everyone/example2.JPG" 
                    alt="Another screenshot of an Android Smartphone where the font size is enlarged and half of the text is not readable because it's trimmed">
                </figure>
            </td>
            <figcaption>It’s impossible to understand what’s going on when some of the text is not visible.</figcaption>
        </figure>
    </tr>
</table>

One might think that increasing the system font size that much is a rare use case. And some people might even say, that this would only be relevant for less than about 5% of their product’s target group. It would not be worth the money to build something only for these few people, so they can be ignored! Right?

Ehh… No.

## Who actually needs accessibility features?

First, everybody thinks of **permanently** disabled people, like people with only one arm, and blind or deaf people.

But there are also **temporarily** disabled people, like someone who has a broken arm and can only use one hand to operate a smartphone.

People move in different environments. So, there are also **situational** disabilities. When you are a new parent, you carry your baby on your arm all the time. Therefore you suddenly just have one hand to use your smartphone. Abilities can change dramatically, depending on the environment you are in.

> “Accessibility is not just about making information available to users with disabilities — it’s about making information available to everyone, regardless of their capabilities or situation.” — Apple

<figure>
    <img src="../../images/building-apps-for-everyone/inclusive-toolkit.png" alt="A diagram with Permanent, Temporary and Situational columns and examples for Touch, See and Hear." />
    <figcaption>Microsoft uses the "<a href="https://www.microsoft.com/design/inclusive/">Persona Spectrum</a>" to help foster empathy.</figcaption>
</figure>

## Which tools does Apple offer to help?

Apple is really good in supporting users with accessibility features. But Android is also not that bad with Google Assistant (and all the features, like Live Caption, Live Relay, and Live Transcribe they have recently announced at Google I/O). As I am an iOS developer, I will only focus on some features which are available on iOS.

### Voice Over

> “You don’t need to see your iPhone to use your iPhone.” — Apple

[Voice Over](https://www.apple.com/de/accessibility/iphone/vision/) is a gesture-based screen reader. You can navigate through elements on the screen by swiping to the right to focus the next element.

<figure>
    <img src="../../images/building-apps-for-everyone/voice-over.png" alt="A screenshot of an app where a cell is selected by voice over and a speech bubble with the text which is read by voice over." />
    <figcaption>Voice Over reads content aloud, like “The Hustle, 6.5 of 10, released on May 10, 2019”.</figcaption>
</figure>

Normally, the position and the spacing between elements like text and images connects the content, but visually impaired users can’t see this. The **content should be bundled semantically**, so it’s read aloud together and will be focused as one element.

### Reading Support

> “You see it. iPhone says it.” — Apple

Turn on [Speak Screen](https://www.apple.com/accessibility/iphone/learning/) and swipe down from the top of the screen with two fingers, or just tell Siri to Speak Screen, to have all the content on pages read back to you.

You can also select text to be read aloud for you with a “Speak” button. This is extremely useful for people who find it easier to listen to a voice rather than read a text.

<figure>
    <img src="../../images/building-apps-for-everyone/speak.jpeg" alt="A screenshot of the popover which appears when you select text and where you can activate "Speak" to read out aloud the selected text." />
    <figcaption>With Reading Support, text can be read aloud for you.</figcaption>
</figure>

### Dynamic Type

[Dynamic Type](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/) converts the text size to a larger (or smaller) size. It’s a systemwide setting, so every third-party app should support it.

<figure>
    <img src="../../images/building-apps-for-everyone/text-size.jpg" alt="A screenshot of the popover which appears when you select text and where you can activate "Speak" to read out aloud the selected text." />
    <figcaption>One quarter of <a href="https://pdfviewer.io/">PDF Viewer Pro</a> users don’t use the default system font size. <a href="https://twitter.com/steipete/status/1053253245810958336">https://twitter.com/steipete/status/1053253245810958336</a></figcaption>
</figure>

These are some statistics about which font size users of PDF Viewer Pro use. It’s interesting to see how many people don’t use the default system font size (L) in iOS — nearly **one quarter**.

While these statistics can be a good validation whether to support dynamic type or not, it should be supported because it’s simply **the right thing** to do.

<blockquote class="twitter-tweet" data-dnt="true">
    <p lang="en" dir="ltr">While these stats are a good validation, not sure I need them to support accessibility features.<br><br>Support dynamic type because it’s the right thing to do. People who use accessibility settings expect them to be consistent every where, the app sticks out if it doesn’t support them <a href="https://t.co/XqLa3UDApn">https://t.co/XqLa3UDApn</a></p>
    &mdash; Vidit Bhargava (@viditb) <a href="https://twitter.com/viditb/status/1102927989669543938?ref_src=twsrc%5Etfw">March 5, 2019</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

## Further Tools

### Reachability

On large iPhones (larger than 4"), you can move the page to the lower half of the device with a double tap (not click) on the Home button, so you **easily reach elements at the top of the screen**. On devices without a Home button, it can be activated with a swipe down gesture in the Home bar at the bottom.

### Display Settings

…like _Zoom, Magnifier, Invert Colours, Colour Filters, Increase Contrast, and Bold Text_.

### Reduce Motion

Some people suffer from motion sickness, therefore it is important to reduce animations and motions in your app when a user has enabled _Reduce Motion_.

### Switch Control

Even if you can’t move from the neck down, you can fully control your phone.

<figure>
    <img src="../../images/building-apps-for-everyone/accessibility-settings.png" alt="The list of accessibility settings in iOS 12" />
    <figcaption>The list of accessibility settings in iOS 12 — it’s long.</figcaption>
</figure>

## Conclusion — Why should we build accessible apps?

### … because users expect that it just works everywhere

Affected users expect accessibility features to work in every app. If they don’t, an app will be noticed negatively.

### … because it’s cheaper when you do it right away

When you focus on implementing accessibility features during the development process of new features, it will be much cheaper than doing it afterwards.

Designers and developers can pay attention to some things that will make it easier to support accessibility.

- Prefer to **put elements underneath each other** instead of side by side, so they will scale much more easily.
- **Never use fixed heights** for elements!
- **Prefer system elements** over custom ones, because most accessibility features are already working for the system ones.

When you have an idea about how a screen should look like with a large font size before the implementation of the feature starts, it will be much easier to implement it directly the correct way.

### … because it can improve the design for all users

The design of a screen is often much simpler and more focused when you design it with accessibility in mind, so it will improve the design for all users, even those who are not disabled.

### … because it improves the code

Apps which support Dynamic Type are often built correctly, so these apps have fewer issues with different device sizes.

### … because it’s simply the right thing

It should be everybody’s goal to include people with different abilities. So, let’s remind ourselves about that in our daily work. Test your app with accessibility features enabled and tell your development team about issues. Your users will be grateful.

---

> “If we use our own abilities as a baseline, we make things that are easy for some people to use, but difficult for everyone else.” — Microsoft

<figure>
    <div style="width:100%;height:0;padding-bottom:56%;position:relative;"><iframe src="https://giphy.com/embed/3oKIPdQnwoQJilRHji" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div>
    <figcaption>Let’s do it right!</figcaption>
</figure>

---

### About this post

_Two weeks ago, I gave a presentation about this topic at our client’s workspace with the goal to change the mindset about who needs an app that supports accessibility features, and how important it is to build an app for everyone. The main target group of this talk was people from our business and lead team. I received great feedback. Some of the attendees didn’t even know about these features and they found it really important to learn about this topic. So, I put my words into this blog post to reach one or two more people (and to remember the points I was talking about)._

_You can find my slides from the talk here: [https://speakerdeck.com/fbernutz/building-apps-for-everyone](https://speakerdeck.com/fbernutz/building-apps-for-everyone)_

### Additional Links

_The following resources were used for the quotes in this blog post and are a good starting point to get more information about Accessibility and Inclusive Design. I highly recommend reading them._

- _Apple and Accessibility: [https://developer.apple.com/accessibility/ios/](https://developer.apple.com/accessibility/ios/_
- _Apples Human Interface Guidelines — Introduction: [https://developer.apple.com/design/human-interface-guidelines/accessibility/overview/introduction/](https://developer.apple.com/design/human-interface-guidelines/accessibility/overview/introduction/)_
- _Microsoft and Inclusive Design: [https://www.microsoft.com/design/inclusive](https://www.microsoft.com/design/inclusive)_
- _Accessible Interface Design: [https://medium.com/salesforce-ux/accessible-interface-design-d80e95cbb2c1](https://medium.com/salesforce-ux/accessible-interface-design-d80e95cbb2c1)_
- _7 Things Every Designer Needs to Know about Accessibility: [https://medium.com/salesforce-ux/7-things-every-designer-needs-to-know-about-accessibility-64f105f0881b](https://medium.com/salesforce-ux/7-things-every-designer-needs-to-know-about-accessibility-64f105f0881b)_

---

This article was also posted on [https://medium.com/@felibe444/building-apps-for-everyone-f5a8d87fdd4a](https://medium.com/@felibe444/building-apps-for-everyone-f5a8d87fdd4a) and [https://adorsys-platform.de/blog/building-apps-for-everyone/](https://adorsys-platform.de/blog/building-apps-for-everyone/)
