---
date: 2026-03-29
title: Why am I warming up to AI assisted coding?
tags:
  - AI
  - Coding
categories:
  - AI Assisted Engineering
---

I see a lot of backlash from software engineers against AI assisted coding, and for a while I was in that camp, but as I gained more experience with the tools I warmed up to them.
Over time I realised that the Genie allows me to concentrate on the problem and its solution rather than bogging down in the code. I'm not saying that we can dismiss bad code and bad engineering. After all in the last twenty+ years I've battled bad code, bad habits and incompetence in all sorts of roles. Some of it were my doing of course, but you learn.

## The small example

I'm writing a service that extract texts from images. All is well, but handling badly organised tables is not easy, so I've added code to do just that, but this works fine only when the input is well-behaved. Depending on the input, the library does all sorts of funny stuff. I've added code to handle the weirdness, but verifying the result is not easy from the command line, and debugging the algorithm is really not intuitive in any sort of textual interface.

The logical thing would be to have a little GUI, displaying the image along with what has been detected. Easy to do, but I had never written a GUI application other than a handful of experiments many years ago. I was always on the non-visual side of software engineering with web-based frontends. I have a really high-level understanding of how to do GUIs and what libraries are out there, but it would take me some time to dig into it again. I appreciate learning but at this point this would be just a distraction.

## The result

So I fired away a few prompts, brainstormed the design and in 30 mins from idea I had a simple little app for me to verify the algorithm. Not perfect, not complete, not sexy but it is there for me to see things in action and debug the result visually. Absolutely the perfect use of AI.
