---
date: 2023-09-14 10:05
description: Sketchnote of NSSpain 2023 talk by Pedro about how to run your LLMs and diffusion models on device
tags: nsspain, nsspain-23, core-ml, swift
image: images/sketchnotes/nsspain23-llm-core-ml-small.jpg
sketchnoteMetadata.contentCreator: Pedro Cuenca
sketchnoteMetadata.linkToContentCreator: https://twitter.com/pcuenq
title: NSSpain 2023: Running LLMs and diffusion models on Mac & iPhone with Swift and Core ML
---

[Link to recording](https://vimeo.com/865550011)

## Detailed image description of the sketchnote

### LLM in CoreML

- scales more, efficently as custom solutions

### Tools

- Hugging Face Hub to choose models or to train vour own model
- StarCoder but Swift was accidentally removed. Oops!
- Falcon
- LLaMA 2 / Code Llama
- High-level tools available
- steep learning curve

### Convert to Core ML

- open source bug fix

### Tokenization

- Byte Pair Encoding (BPE)
- `swift-transformers` package with most common logic

### Use the Model

- Generating Text one token at a time!

### Optimization

- Stable Diffusion with Core ML on Apple Silicon
- Quantization & Caching
