---
date: 2026-03-18
title: Your LLM Doesn't Write Correct Code. It Writes Plausible Code
tags:
  - AI
  - Coding
categories:
  - AI Assisted Engineering
---

I've taken the liberty of reusing the title of a [Substack post](https://blog.katanaquant.com/p/your-llm-doesnt-write-correct-code). It's a great post and worth reading, although it makes a
different point from the one I'm making here.

When one is prompting the language model to generate code, one relies on the collective knowledge slurped up in the model's training data. One might get the feeling that the piece of code written in front of one's eyes is unique, but in reality it is absolutely not. At least it is not, most of the time. This might come as a surprise, but this is something one needs to keep in mind.

## Tiny primer

At the risk of wasting your time (but of course if you have a good understanding of LLMs, just skip to the next section), let's have a quick recap on LLMs: these are statistical machines. A huge amount of data is fed to them as "training data", and based on the statistical probabilities, they generate some output.
The key point to understand here: for things where there are lots of examples, the result is good. When there is little or no data, the output is just crap.
These things are not "thinking", they don't have an "understanding" (we just don't have better words to describe it), they only produce the most likely output for the input based on their training data. That's all, nothing else to it.[^footnote]

## Why does this matter?

The project I'm working on is somewhat unique, with apparently not many, if any, shoulders to stand on. What does this mean in practice? The net result is that I can't just prompt the agent to solve the core problem. I mean, I can, but the result is garbage. Not just in the code-style sense, but actually it doesn't solve the problem simply because the problem is not universally solved.
That leads me to the situation where there are pieces where I can rely heavily on the agent (quick, precise, solid code), but then I hit a wall because there is no training data for the problem. This is the point where I need to sit in front of the screens and think hard about the solution.
Once I have an idea, I can prompt again with the description of the algorithm. Or I can just write my minimal "happy-path" of the core logic and prompt the agent to fill in the blanks.

## Why am I writing this?

So back to the "it writes plausible code". I think we can think about categorising our code. As above, most of the time what we write is not unique. It might be that how we're using the code for our needs is unique, but I would say that it is not the case most of the time either.

Basically what I'm saying is that the code can likely be split into 3 levels:
* Level 0 - this is the core logic. This is the thing where the engineer pulls out their hair, stares at screens for hours on end, and with a bit of luck they come up with something truly unique. Using different words: this is the code without which the project wouldn't exist or there would be no point for it to exist.
* Level 1 - this is the scaffolding making Level 0 usable. Think about calling APIs, handling error conditions, dealing with filesystems, etc. This code is absolutely not unique. There are myriad examples, but this is where we recombine the examples to suit our taste. That taste, of course, gives the aura of uniqueness, and there is merit in that feeling, but this is just an illusion.
* Level 2  - this is everything else within the project's codebase. Think about argument parsing, logging, generating JSON, and rich command-line interfaces. Anything that is not Level 0 and 1.

Once we have this understanding, we can quickly turn to the agent with well-grounded expectations:
* For Level 2, the agent will give production-ready stuff requiring only a cursory look: there are endless examples in the training data. A falafel is a falafel; if it's done differently, it is not a falafel anymore.
* For Level 1, the agent will give good code, but as this is more about one's personal taste, review has to be a bit more thorough. Not necessarily to verify the soundness of the generated code, but more to weed out the bad taste. Again, tastes are different and one's "falafel" might look like a falafel, but perhaps adding lots of vinegar to the mix won't give the result one is expecting, and we can rely on the collective wisdom of all the chefs.
* As for Level 0? You're on your own, my friend. I'm not saying that the agent won't help. Of course it will. It can give ideas and hints. It might point to a library or technique that can be used to reach the goal, but as something new is being invented, the agent won't produce the code that can just be waved through. It can't: there are no examples.

## Little experiment

Once I had the above idea, I ran some experiments to figure out what the percentages for Level 0, 1, and 2 are in my code. For that, I made a prompt and asked the Genie to classify the code lines into these levels. For the project in question, the numbers are as follows:
* L0 - ~40%
* L1 - ~30%
* L2 - ~30%

## Where does this leave us?

Think about your code. Use the genie for Level 1 and Level 2, and you'll have a great result. For Level 0, as above, the genie won't help. If anything, it will hinder, misguide, gaslight, and put you off track. This is where you need to pull up your sleeves and write the code.

In other words: if the genie can give you a perfect answer written in code to all your prompts without you having any doubts about said code, then likely you're just copying something that has been done elsewhere, likely multiple times.
Don't get me wrong, I'm not dismissing the effort, but perhaps this is a good indicator for you to start looking around for ready-made solutions. Likely there will be a few.

## For the gullible

Of course the vendors will showcase their product with prompts like: "Create me a basic Photoshop clone running in the browser", and of course the result will blow minds.
But did you ask the same genie to provide a functional description with architecture diagrams for Photoshop? You'll be surprised by how complete that description looks. No wonder, there are plenty of clones, lots are open source, and millions of people use it daily, with extensive descriptions of all the features detailing the internals.

Now ask something unique, for example: "Imagine an alien world, where the aliens are not counting in natural numbers, but they use real numbers. For them, the natural numbers are a construct in the same way as real numbers are a construct for us. What might that world look like from a societal point of view?"[^fn-nth-2]

[^footnote]: *Note: of course, it doesn't mean that they don't surprise us. After all, they have all the code stored somewhere in their corpus, while we just don't have such capacity in our brains.*
[^fn-nth-2]: *Note: the above prompt is actually a fun exercise and I had a really good laugh reading through the output, but can I use it for anything? Not really, but it gives me ideas to develop this further. This is your Level 0 code, and this is where the LLM can't help.*
