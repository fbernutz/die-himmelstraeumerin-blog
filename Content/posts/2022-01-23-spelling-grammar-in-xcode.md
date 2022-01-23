---
date: 2022-01-23 13:22
description: Typos in code can always happen, we’re all human. Most of us aren’t native speakers and write their code in English anyway. But typos in code can be annoying. Other developers will eventually stumble across them and can get distracted reading the code. At best, they will fix the typo, but it will be bit of work to make the change, commit the code etc. It would be better not to introduce typos in the first place, right? Someone should be alerting us to typos as we write the code! Well, Xcode can actually do that!
tags: ios, xcode
image: images/2022-01-23-spelling-grammar-in-xcode/preview.jpg
---
# Typos in Xcode – Never Again!

Typos in code can always happen, we’re all human. Most of us aren’t native speakers and write their code in English anyway. But typos in code can be annoying. Other developers will eventually stumble across them and can get distracted reading the code. At best, they will fix the typo, but it will be bit of work to make the change, commit the code etc.

It would be better not to introduce typos in the first place, right? **Someone should be alerting us to typos as we write the code!** Well, Xcode can actually do that!

<figure>
    <img src="../../images/2022-01-23-spelling-grammar-in-xcode/before-after.png" alt="On the before screenshot, you see a text ´Spellling is hard’ with a typo and on the after screenshot, you see the same text but with a red underline on the word which is not spelled correctly." />
    <figcaption>Before and after activating the Spelling and Grammar setting.</figcaption>
</figure>

## How to activate the setting

- Open Xcode
- Have your cursor in a file with text (otherwise you can’t activate the setting and it will be greyed out)
- Activate the setting in Xcode’s system menu with: `Edit > Format > Spelling and Grammar > Check Spelling While Typing`

<figure>
    <img src="../../images/2022-01-23-spelling-grammar-in-xcode/setting.jpg" alt="A screenshot from Xcode’s system menu to the setting" />
    <figcaption>The path to the setting in Xcode.</figcaption>
</figure>

## 🥳 Benefits

- This is not limited to comments and **will also work in variable/function/type names**, even in camelCase syntax.
- It’s especially **useful if your hardware keyboard has some issues** and keys are stuck while typing and you get repetitive characters without recognizing it.
- It even works with multiple languages if the setting for it is activated (check it in `Preferences > Spelling`).
- You and your colleagues don’t have to make others aware of typos anymore.
- If you use some idioms or specific words in your company, which are spelled correctly, but Xcode is complaining about them, you can let the **system learn a word**, so you’re not seeing the red underline anymore.

## See Video

<figure>
    <video controls>
        <source src="../../images/2022-01-23-spelling-grammar-in-xcode/activate-spelling-and-grammar-checks.mov" type="video/mp4">
    </video>
    <figcaption>See a workflow with how to activate the setting in Xcode.</figcaption>
</figure>
