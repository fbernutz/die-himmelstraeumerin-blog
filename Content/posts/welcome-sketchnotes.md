---
date: 2020-03-28 10:00
description: When I released my website in January 2020, I was a hundred percent sure, that I wanted to add my sketchnotes in it as well... but I needed more time to think about how to implement it and I was also unsure about how the layout and navigation should look like.
tags: post, website, sketchnotes
---

# Welcome, Sketchnotes!

Some years ago, a friend of me asked why I don't want to have my own website where I could host my content. To this time, I was mostly active on Instagram where I posted my photographs. This was something I've never thought of before. Why should I invest time to create a website, when mostly everyone uses platforms like Instagram or Twitter to consume content on a daily basis?

But with this conversation the first seed was planted. The more I thought about it, the more I've realised that I could have full control over the content I post on my website. I won't stop posting things on Twitter, but now I can refer to my website to share content. It feels awesome to have an own little place in the big world of internet, where everything which matters to you can be discovered. A place with things you've created and are proud of.

When I released my website in January 2020, I was a hundred percent sure, that I wanted to add my sketchnotes in it as well... but I needed more time to think about how to implement it and I was also unsure about how the layout and navigation should look like.

## What was the plan? Which things needed to be done?

### 1) Navigation to access the sections

I need a navigation bar to access the new section. That was one of the easier things, because I had some example in mind, which I liked and could get inspired on.

It's a simple white rectangle with the (currently) two sections "Posts" and "Sketchnotes". When you hover over one of the elements, you see a line under the text. This looks the same when this section is selected.

<img src="../../images/welcome-sketchnotes/navigation-bar-hover.jpg" alt="Screenshot of hover State of Navigation Bar with underlined section" />

### 2) Preview of recent sketchnotes

On the root of my website, you see some recent items. I wanted to add my latest sketchnotes to this page. This is only a small part from the content of page `/sketchnotes` with the same design. So, let's jump directly to this page.

### 3) List of all sketchnotes

I wanted to have an overview of all my sketchnotes. On the page `/sketchnotes` you can see a list of all sketchnotes with smaller images as thumbnails.

<img src="../../images/welcome-sketchnotes/sketchnote-list.jpg" alt="Screenshot of page with list of skecthnote" />

To have a website which is performant and loads its content quickly without using your whole monthly mobile data, was very important to me.

Google gives a nice insight on why optimizing images is so important:

> Images often account for most of the downloaded bytes on a page. As a result, optimizing images can often yield some of the largest byte savings and performance improvements: the fewer bytes the browser has to download, the less competition there is for the client's bandwidth and the faster the browser can download and render content on the screen.

(_see the [article: Optimize Images](https://developers.google.com/speed/docs/insights/OptimizeImages)_)

I created a [script](https://github.com/fbernutz/die-himmelstraeumerin-blog/blob/master/create-thumbnails.sh) to easily generate thumbnails for the list. The script uses the power of [ImageMagick](https://imagemagick.org/index.php) to resize all images and to save the resized image in a new image with a suffix `-small`. It has already saved me tons of hours with resizing images!

Creating the layout for the list was a challenge for me. Every sketchnote has **different aspect ratio** and they exist in **both orientations**, landscape and portrait. I wanted to have the latest sketchnotes on the top. With this you would be able to scroll down and see how the sketchnotes developed. Additionally, I wanted a **CSS only solution**, because I like javascript free websites. I'm a totally unexperienced newbie when it comes to HTML and CSS, so I had to learn a lot about different HTML layout techniques. There are many different tutorials for photo grid layouts out there and I've tried different kinds, like CSS grid, flexbox and finally used a column layout, which worked best for me.

In the next image the numbers from 1 to 12 display the creation date from new to old, which means sketchnote 1 is the latest and sketchnote 12 is the oldest. The blue lines display which side should have the same length for every image. I don't want to crop the sketchnotes in preview and images shouldn't be distorted (who would ever want this?!), one side – either height or width – needs to have a fix length for all images.

<img src="../../images/welcome-sketchnotes/html-layout.jpg" alt="Four possible list layouts" />

- (1) is what I want to achieve
- (2) is what I achieved with grid layout
- (3) is what I achieved with flexbox
- (4) is what I achieved with column layout

Layout 4 is nearly the same as Layout 1 and is therefore **nearly perfect**. Only the order of the images is not like wanted. Nevertheless, I chose this layout to be the final one (for the moment).

### 4) Detail of sketchnote

To layout the detail page of a sketchnote was way easier than the list. The page consists of the title, the image of the sketchnote, the date and the tags. As some sketchnotes are too high to see them complete without scrolling, I added a link on the image to open it in a new tap in full resolution. In the new tap the browser navigation features can be used to zoom in and out in the image.

<img src="../../images/welcome-sketchnotes/sketchnote-detail.jpg" alt="Screenshot of detail page of skecthnote" />

The static HTML for this website is generated with [Publish](https://github.com/JohnSundell/Publish). To have as less manual work as possible when adding a new sketchnote, most of the HTML for the detail page is generated. This means, I add the content for the page in a markdown file, add some logic how the HTML should look like and Publish generates the HTML from this mix of content and HTML logic.

A markdown file for a sketchnote detail page looks like this:

```markdown
---
date: 2020-03-28 20:50
description: Sketchnote about XYZ
tags: sketchnote, xyz
image: ../../images/sketchnotes/sketchnote-xyz-small.jpg
---

## Sketchnote XYZ
```

I manually add information about:

- the **date**, when I created the sketchnote, which is used to sort the list of sketchnotes
- the **description**, which is also used as alt tag for the sketchnote
- **tags**, which can be used as filter to find other sketchnotes
- the **path to the thumbnail image**
- the **title**, which can't be generated from the image name

I remove the part `-small` from the path to the thumbnail image to get the path to the original image and add a HTML structure around the full size image. This is done by code for all sketchnote details.

## How do I add a new sketchnote?

1. First of all, I add the sketchnote image with a "good" naming to the `/Resources/images/sketchnotes/` folder. The naming is important because the name will also be used for the URL for the detail page.

2. If the image isn't of type `.jpg`, I can run a script to convert `.png` to `.jpg` by running `make convert-png`. All tasks are defined in a [`Makefile`](https://github.com/fbernutz/die-himmelstraeumerin-blog/blob/master/Makefile), which was added to easily demonstrate which tasks can be run in the project and to easily run these tasks.

3. A thumbnail for the list has to be created. Therefore I run the script, I've mentioned earlier, by running `make thumbs`.

4. I create a markdown file, where information about the content is added. I copy an existing file most of the time, name it like the image and only update the data inside the file.

5. Run `make` to generate the new HTML code.

## Next steps

I have thousand ideas what to do next and what to improve.

- I think about adding the **name of the speaker or author**, because none of these sketchnotes could be created without a speaker or an author.
- To get some more details of a sketchnote in the list, I want to **display the title on hover**.
- In some way, it would be great to **improve dark mode for sketchnotes**. Currently they are white images on a dark background. If anyone has an idea, please share it with me!

---

That's it! Feedback or comments are highly welcome! Leave me a message in twitter.
