---
layout: post
title:  "Your LLM Doesn't Write Correct Code. It Writes Plausible Code."
date:   2026-03-18 13:12:49 +0000
categories: LLM
---

# Your LLM Doesn't Write Correct Code. It Writes Plausible Code.

I've took the liberty to reuse the title of a [substack post](https://blog.katanaquant.com/p/your-llm-doesnt-write-correct-code). It is a great post and you should have a read, although it addresses something completely different than the post above.

When one is prompting the language model to generate code one relies on the collective knowledge slurped up in the model's traning data. One might get the feeling that the piece of code written in front of one's eyes is unique, but in reality it is absolutely not. At least it is not, most of the time. This might come as surprise but this is something one needs to keep in mind.

## Tiny primer

With the risk of wasting your time (but of course if you have a good understanding off LLM's just skip to the next section) let's have a quick recap on LLMs: these are statistical machines. Huge amount of data is being fed to them as "training data" and based on the statistical probabilites of the training data it will generate some output.
the key point to understand here: for things where there are lots of examples there will be a good result. When there are little or no data, the output is just crap.
These things are not "thinking", they don't have an "understanding" (we just don't have better words to describe), they only produce the most likely output for the input based on their traning data. That's all, nothing else to it.
**Note: of course, it doesn't mean that they don't surprise us. After all they have all the code stored somehere in their corpus when we just don't have such capacity in our brains." 

## Why does this matter?

The project I'm working on, is somewhat unique with apparently not many / if at all shoulders to stand on. What does this mean in practice? The net result is that I can't just prompt the genie for the core problem I'm trying to solve. I mean, I can but the result is garbage. Not just in the code style sense but actually it doesn't solve the problem simply because the problem is not universally solved.
That leads me to the situation where there are pieces where I can rely heavily on the agent (quick, precise, solid code) but then I hit a wall of not having training data for the problem. This is the point where I need to sit in front of the problem staring at screens and thinking hard about the problem and it's solution.
Once I have the idea, I can then prompt again with the description of the algorithm. Or I can just write my minimal "happy-path" implementation of the core logic and prompt the agent to fill the blanks, do the scaffolding.

## Why am I writing this?

So back to the "it writes plausible code". I think we need to start thinking categorising the code we write. As above - most of the time what we write is not unique. It might be that how we're using the code for the problem of ours is unique, but I would say that is not the case most of the time either.
Basically what I'm saying is that the code is likely can be split into 3 levels:
* Level 0 - this is the core logic. this is the thing where the engineer pulls out their hair, stares on screens for hours on no end and with a bit of luck they come up with something truly unique. Using different words: this is the code without which the project wouldn't exist or would be no point for the project to exist.
* Level 1 - this is the scaffolding around Level 0. The code that makes Level 0 code useable. Think about calling API's, handling error conditions, dealing with filesystems, etc. This code is absolutely not unique. There are miriad of examples, but this is where we recombine the examples to suite our taste. That taste of course gives the aura of uniqueness, and there is merit in that feeling but this is just an illusion.
* Level 2  - this is everything else within the project's codebase. Think about argument parsing, logging, rich command line interface. Anything that is not Level 0 and 1.

Once we have this understanding we can quickly turn to the agent with well grounded expectations.
For Level 2, the agent will give precise code, production ready stuff, requiring only a cursory look in the PR: there are endless examples in the training data for these things. A falafel is a falafel, if it's done differently it is not a falafel any more.
For Level 1, the agent will give good code, but as this is more about one's personal taste review has to be a bit more thorough. Not necessarily to verify the soundess of the generated code, but more to weed out the bad taste. Again, tastes are different and your "falafel" might look like as a falafel, but perhaps adding lots of vinegar to the mix won't give the result you're expecting and we should rely on the collective wisdom of all the chefs. 

As for Level 0? You're on your own my friend. I'm not saying that the agent won't help. Of course it will. It can give you ideas, hints, it might point you to a library or technique that you can use to reach your goal, but as now you're inveting something new, the genie won't produce the code you can just wave through. It can't: there are no examples.

## Little experiment

Once I had the above idea, I just run some experiments to figure out what are the percentages for Level 0, 1 and 2 in my code. For that I made a prompt and asked the Genie to classify to group the codelines into these levels. For this project the numbers are as follows: (TODO: pull the data)

## Where does this leave us?

Think about your code. Use the genie for Level 1 and Level 2, you'll have a great result. For Level 0, as above: the genie wont' help. If anything it will hinder, misguide, gaslight, it will put you off track. This is where you need to pull up your sleves and write the code.

In other words: if the genie can give you perfect answer written in code to all your prompts without you having any doubts about said code, then likely you're just copying someting that has been done elsewhere, likely multiple times.
Don't take me wrong, I'm not dismissing the effort, but perhaps this is a good indicator for you to start looking around the web for solutions. Likely there will be a few around.

## For the gullible

Of course the vendors will showcase their product with prompts like: "Create me a basic photoshop clone running in the browser" and of course the result will blow your mind.
But did you ask the same genie to provide you a functional description with architecture diagrams for Photoshop? You'll be surprised how complete that description looks like. No wonder, there are plenty of clones, lots are open source, millions of people use it daily with extensive description of all the features detailing the internals.

Now ask something unique, for example: "Imagine an alien world, where the aliens are not counting in natural numbers, but they use real numbers. For them the natural numbers are a construct in the same way as real numbers are a construct for us. How that world might look like from a societal point of view?"

Note: the above prompt is actually a fun excercise and I had some really good laugh reading through the output, but can I use it for anything? Not really, but it gives me ideas to develop this further. This is your Level 0 code, and this is where the LLM can't help.