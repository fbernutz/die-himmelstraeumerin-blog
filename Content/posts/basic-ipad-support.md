---
date: 2021-02-14 12:00
description: I have a confession to make. It’s really sad, but true. In my career as an iOS developer, I’ve only ever build iPhone apps. iPads were never meant to be supported. Well... the apps "worked" in theory! Sort of. So, during my vacation in December, it was finally time to start working on the two-plus years old ticket to add iPad and iPhone landscape support for Cineaste App.
tags: iOS, iPadOS, iPad
image: images/basic-ipad-support/preview.jpg
---

# How I Added Basic iPad Support to my iPhone Only App

I have a confession to make. It’s really sad, but true. In my career as an iOS developer, I’ve only ever build iPhone apps. iPads were never meant to be supported. Well... all apps "worked" in theory! Sort of.

<figure>
    <img src="../../images/basic-ipad-support/scaled.png" alt="Screenshot of scaled app on iPad" />
    <figcaption>A "beautifully" scaled iPhone app on iPad.</figcaption>
</figure>

So, during my vacation in December, **it was finally time to start working on the two-plus years old ticket** to add iPad and iPhone landscape support for [Cineaste App](https://github.com/spacepandas/cineaste-ios).

I gave myself a Christmas present and finished the feature on Christmas Eve (see the [final PR on GitHub](https://github.com/spacepandas/cineaste-ios/pull/160)). The current version is [available for testing on Testflight](https://testflight.apple.com/join/sAfD3j8m).

**Feel free to test the app and send feedback!** I would really appreciate it. 🙌

So, what did I do to add basic iPad and landscape support?

## 1) Activate that Checkmark!

The first important step is to **activate that checkmark for iPad** support. You can find that setting in Xcode under the settings of your main target under the tab "General" and the section "Deployment Info".

<figure>
    <img src="../../images/basic-ipad-support/checkmark.jpg" alt="Screenshot of checkmarks to activate iPad support in Xcode" />
    <figcaption>Activate the checkmark for native iPad support in Xcode.</figcaption>
</figure>

Cineaste App was also pinned to portrait orientation before. If you want to support landscape mode as well, activate the checkmarks for the new orientations too. You can find them directly below the checkmarks for the supported device categories.

## 2) Run and See What’s Broken

If you’re brave enough, pick an iPad as simulator, run your app, and see what’s broken. In my case, there were some layout issues, but all in all, it didn’t even look _that_ bad. I was surprised! My goal was to create minimal iPad (and iPhone landscape) support that satisfied me for now. Bigger improvements can be made later.

<figure>
    <img src="../../images/basic-ipad-support/first-issues.png" alt="Screenshots of the app without further optimization running on iPad and iPhone landscape. There are some issues with the safe area and some images which are way too big." />
    <figcaption>Screenshots of the app running on iPad and iPhone landscape without any further optimization.</figcaption>
</figure>

Let’s fix the layout problems! But one thing at a time.

## 3) Layout Issues and Optimization

### Large Poster Images on iPad

On the iPad, the **poster images** (and therefore the cells) **are a little bit too large**.

<figure>
    <img src="../../images/basic-ipad-support/poster-size.png" alt="Screenshots of the movie list before and after. On the before screenshot, the poster images are way larger than on the after screenshot." />
    <figcaption>On the left the watchlist with large poster images (before) and on the right with smaller poster images (after).</figcaption>
</figure>

The images use a "Proportional Width" constraint which is set to ~20% of the screen width. This means on larger devices, the images are larger, too. To make the images a bit smaller on large devices, I programmatically updated the percentage of the constraint depending on the screen size.

For tips on how to use size classes for different layout on different devices, I can recommend the talk ["Size Doesn’t Matter: Building an App for Every iOS Device"](https://www.youtube.com/watch?v=2sImrtlesfQ) by Janina Kutyn from AppBuilders 2019. 🍿

### Safe Area Issues on Landscape Mode

Some **safe area settings** (for the toolbar or the poster) need improvements in the movie detail screen when using the iPhone in landscape mode. 

<figure>
    <img src="../../images/basic-ipad-support/safe-area.png" alt="Screenshots of the movie detail before and after. On the before screenshot, the toolbar is misplaced and the poster has spacing to the left and right. On the after screenshot, the toolbar is positioned at the bottom and to both sides. The poster also uses the same width." />
    <figcaption>On the left the movie detail with wrong toolbar and poster size (before) and on the right toolbar and poster use the whole width (after).</figcaption>
</figure>

To fix the issues with the safe area on landscape mode, I constrained the toolbar to not respect the safe area and to use the superview instead. The reason for this is, that toolbars automatically respect safe areas. The `UIBarButtonItems` are positioned respecting the safe area, so they have enough space on both sides. It doesn’t matter when small parts of the poster are not visible, so I set constraints to the superview on both sides.

### Fix Table View Background Color

It looks weird to have a white area next to the poster. So, the **table view background color** in the lists on iPhone landscape should have no color and show the background color.

<figure>
    <img src="../../images/basic-ipad-support/background.png" alt="Screenshots of the movie list before and after. On the before screenshot, the movie cells have a white background. On the after screenshot, the poster and therefore cells are smaller and the background is dark." />
    <figcaption>On the left the watchlist with white background and large poster images (before) and on the right with clear background and smaller cells (after).</figcaption>
</figure>

There is still an [unresolved bug](https://github.com/spacepandas/cineaste-ios/issues/164) (on iOS 14 only), where a table view cell shows a white background when using a long tap to see the contextual menu. Anyone has an idea how to fix this?

### Movie Detail and Poster Height

Most of the work has to be done in the movie detail screen in landscape mode. You **shouldn’t see a full screen image when navigating to the screen and then have to scroll a few times** to see the information about a movie.

<figure>
    <img src="../../images/basic-ipad-support/large-poster.png" alt="Screenshots of the movie detail before and after. On the before screenshot, the poster is visible full screen, you have to scroll to see movie information. On the after screenshot, the poster is only visible 40% of the screen height and you see some movie information directly underneath." />
    <figcaption>On the left movie detail with a full screen poster (before) and on the right the poster with some movie information directly underneath (after).</figcaption>
</figure>

The screen is the most complex of the app. It contains two scroll views which are used to add a parallax effect on the poster when scrolling down.

To prevent seeing a full screen image initially, I added a "Proportional Height" constraint to the poster of 60%. This means when the device is in portrait mode, 60% of the screen displays the poster and you can already see 40% of movie information underneath. When rotating the device, it’s the same logic. A user then sees way less of the poster than in portrait mode, but there’s always the possibility to tap on the poster to see it full screen anyways.

It sounds simple to add one constraint but I introduced some new bugs with every release and needed some TestFlight versions until I got everything working correctly on iPad portrait and iPhone landscape. 🙈

The biggest part of work is done 💪 Yay!

## 4) Prevent Crashes

It can happen that your app crashes on the iPad, but it doesn’t on the iPhone. Some UI elements, like `UIAlertController` or `UIActivityViewController` are displayed in a popover style on the iPad. Therefore they either need a `UIBarButtonItem` or a `sourceView` and `sourceRect` as anchor point to display the popover.

To check if your app crashes on the iPad, tap every button you have in the app. Additionally, look through your code and search for `UIAlertController` with style `actionSheet` or `UIActivityViewController` and set the information on the property `popoverPresentationController` to prevent crashes.

```swift
let actionSheet = UIAlertController(title: "Contact", message: nil, preferredStyle: .actionSheet)
let action = UIAlertAction(title: "GitHub", style: default) { _ in 
    /* link to GitHub */ 
}
actionSheet.addAction(action)

// 1) use the `UIBarButtonItem` to display the popover
actionSheet.popoverPresentationController?.barButtonItem = barButtonItem

// 2) use the center of a view to display the popover, for example on a `UITableViewCell`
actionSheet.popoverPresentationController?.sourceView = cell
actionSheet.popoverPresentationController?.sourceRect = CGRect(
    x: cell.bounds.midX,
    y: cell.bounds.midY,
    width: 0,
    height: 0
)
```

## 5) Add More App Icons

After running the app on the simulator you might have noticed that **your app has no app icon** anymore. We need to add the icon in some more sizes. To do that, choose the "AppIcon" in your Asset Catalog and on the Attributes Inspector, activate another checkmark "iPad". With a tool of your choice ([I really like "Icon Generator" which is open source](https://github.com/onmyway133/IconGenerator)), generate the missing assets in the correct sizes and assign them in the Asset Catalog.

<figure>
    <img src="../../images/basic-ipad-support/app-icons.jpg" alt="Screenshot of app icons in AssetCatalog in Xcode" />
    <figcaption>Screenshot of App Icons in AssetCatalog in Xcode.</figcaption>
</figure>

Awesome, that’s it! At this point we are almost good to go!

## 6) Additional Tasks

To release your app update on the AppStore, you should **record some new iPad screenshots**. To record screenshots for the AppStore, [`fastlane screenshots`](https://docs.fastlane.tools/getting-started/ios/screenshots/) could be the tool of your choice.

When you have an external mouse or touchpad, you _can_ test the **cursor behaviour** and **right click menu** of your app. I didn’t optimize something for that, because it looked already good in my opinion. Maybe this is because I only use default iOS elements and don’t want to have any special behaviour. With a right click, the app displays the contextual actions automatically, which is really cool.

## 7) That Last Big Improvement

In January, I read about `layoutMarginsFollowReadableWidth` for improved reading experience (see the [thread with lots of awesome tips](https://twitter.com/JordanMorgan10/status/1267239117521399815) by [@JordanMorgan10](https://twitter.com/JordanMorgan10)). I loved the idea and the movie detail screen (on large devices) was the perfect scenario to use this feature.

If you’re working with storyboards, you can activate "Follow Readable Width" Layout Guide, instead of "Safe Area Relative Margins". In my case, I changed the layout guide of the stack view which contained the textual content. The stack view automatically adds insets to respect the readable width.

<figure>
    <img src="../../images/basic-ipad-support/follow-readable-width.jpg" alt="Screenshot of storyboard with Follow Readable Width Layout Guide in Xcode" />
    <figcaption>Screenshot of Storyboard "Follow Readable Width".</figcaption>
</figure>

I think this is a major improvement.

<figure>
    <img src="../../images/basic-ipad-support/readable-width.png" alt="Screenshots of the movie detail before and after. On the before screenshot, the movie information have a width of the full screen. On the after screenshot, the movie information have a maximum of 130 characters per line, so it’s easier to read a longer text." />
    <figcaption>On the left movie detail with full width text (before) and on the right the text with a nice readable width (after).</figcaption>
</figure>

For more information about that, read ["Readable Content Guides"](https://useyourloaf.com/blog/readable-content-guides/) at Use Your Loaf. Even though it’s a post from 2016, it’s still relevant. 📚

I think with all these changes, the iPad version looks ~1000% better than before. But there are still some things which I may want to change in the future.

## What’s missing?

I loved the [article "Designed for iPad"](https://medium.com/lookup-design/designed-for-ipad-a77f05c4919a) by [@viditb](https://twitter.com/viditb) which helped me a lot to identify what I’m still missing. 📚

The currently missing features are:

- Keyboard Support (maybe use [KeyboardKit](https://github.com/douglashill/KeyboardKit) for that?)
- Multi Window Support (but I’m not sure if this is really relevant for this app)
- Drag and Drop Support (but I’m not sure if this is really relevant for this app)
- Improved Layout for iPad (the movie lists still don’t use the optimal layout, a better idea would be to use a split layout with `UISplitViewController`, a Grid Layout with a `UICollectionView`, or at least make use of a side bar to use the space on larger devices more efficient)

## Conclusion

Adding support for iPad adds _a lot of complexity_ to your app. You have to test so much more! There are many more different devices now, there is the split screen layout, you have to test rotating the devices, and and and...

But I really enjoyed it and it’s worth it!

<img src="../../images/basic-ipad-support/preview.jpg" alt="An iPad on a table with Cineaste App on screen. It shows a movie detail of the movie Weathering With You." />

I had such respect for this task, but in retrospect it was not _that_ difficult in my case. (This impression may vary, of course,  depending on what your app does.) Just try it and improve it step by step. It doesn’t have to be perfect right away.

---

This was my first experiment with iPad support. Please get in touch on [Twitter](https://twitter.com/felibe444) and tell me what I might have missed or what I can improve.
