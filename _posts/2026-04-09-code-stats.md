---
date: 2026-04-09
title: AI or not? What does the analysis tell us?
tags:
  - AI
  - Code
  - Analysis
categories:
  - AI Assisted Engineering
  - Code Analysis
---

**TL;DR:** Check out my little project that (A)I coded in a few days to compare code analysis over AI and non-AI assisted opensource projects at [shibuyaltd.co.uk/code-stats](https://shibuyaltd.co.uk/code-stats){:target="_blank"}.

## Preamble

A few days ago the complete source code of [Claude Code leaked](https://thehackernews.com/2026/04/claude-code-tleaked-via-npm-packaging.html){:target="_blank"} in a funny way. I of course jumped on the opportunity and had a go on the source code, but I wasn't exactly interested in any of the usual suspect questions like: *"Is it secure?"*, *"What are the new features?"*. The source code might be interesting in many ways, but there will be plenty people doing all sorts of analysis with all sorts of conclusions. Also, the key here is the model, not the harness: we have plenty harnesses readily available on github.

Having said that ... the Anthropic team claims that all of claude code is written by agents (so does the Codex team by OpenAI) and the vendors are pushing the narrative that **"Development is solved"** and that engineers are now better to switch profession as the agents will write all code.

So here we have at least two questions to answer:
* Is agentic coding quicker?
* Is agentic coding produces production quality code?

## Is it quicker?

That's a simple thing to answer, we just need to calculate `LOC / project_duration_in_weeks / nr_of_contributors` and compare it to other projects that are known for not using AI.

## Is it production quality?

Now, that's a bit more trickier. After all it's just a bunch of text and how does one even compare a project to another? Luckily this is a topic I'm interested since ... since after ~5 years I've started doing software engineering in a professional setting. That's a good 20 years at this point. I won't go into details here, but [Wikipedia](https://en.wikipedia.org/wiki/Software_metric) is always a good starting point if one wants to bore oneself with the topic.

## How did this madness start?

It started with answering the first question:
* `LOC` - easy, just get the code, run [qlty](https://github.com/qltysh/qlty){:target="_blank"} on said code and one has the metrics. *(and the errors, the warnings, etc.)*
* `project_duration_in_weeks` - that's not so easy, but not impossible. As Claude Code is closed source we can only go by the [changelog](https://code.claude.com/docs/en/changelog){:target="_blank"} which starts with *0.2.21* at 02/04/2025.
* `nr_of_contributors` - again, closed source so hard to tell. But one can use the tools of the adversary and both ChatGPT and LeChat gives a reasonable answer based on all sorts of sources putting the range between 5 to 25.

Running those numbers we end up with:

 nr. of engineers | LOC/week
------------------+----------
 5                | 2,000
 10               | 1,000
 25               |   400

### But how does this compare?

So I've asked ChatGPT, LeChat and Gemini about *"average LOC/week for a mid level engineer"*. I know - this is the worst possible thing to do and I'm ashamed about myself, but the good thing with statistics is that at the end they can tell the truth.

The combined answer is roughly like this:
* *"A mid-level engineer is not expected to hit a specific LOC number. If you forced a rough heuristic, ~200–800 LOC/week is a loose observational range—but any team using that as a KPI is likely measuring the wrong thing."* - says ChatGPT
* *"For a mid-level engineer, 500–1,500 LoC/week is a reasonable benchmark in most industries, but context matters more than raw numbers. At companies like Anthropic, AI tools may push this significantly higher, but the focus remains on value delivered, not lines written."* - states LeChat (but also give us some interesting ranges: 500 - 2,000 based on studies; 1,000 - 1,500 by MS internal data; 200 - 1,200 by Google; 1,500 - 3,000 in startups)
* Gemini? the anser is **Yes!** as gemini being gemini.

So, comparing the above numbers we can conclude that what the vendors are claiming is just not true and what is true is what the researchers are finding. But I'm using these tools for a while now and I just can't believe that because I see something else. Caveat emptor: I'm using the tools in a non-exactly-professional setting while having nothing else to do. i.e.: no meetings, no discussions, no office politics, no ever changing priorities.

Also, LOC/week is a hard measure. As in: no engineer want this measured for good reasons.

I've spent another hour to combing through open source projects, cloning them, running `qlty metrics -a`, figuring out project timelines, eyeballing average number of contributors and compiling the numbers. Lo and behold, the ballparks were not even up to the 100 lines per week for the projects I gauged.

That's not good. That is really not good. 

## Where did we end up?

So, on 2nd of April I span up Codex and started to AI Engineer my way into this madness: **to compare apples-to-apples based on real data**. The result you can see @ [shibuyaltd.co.uk/code-stats](https://shibuyaltd.co.uk/code-stats){:target="_blank"}. Feel free to play and draw your own conclusions.[^footnote]

## My conclusion?

Not much.

* Clearly, **AI assisted coding is significantly faster**.  
  Like at least a magnitude (ie.: one more zero at the end) faster. Some of the projects even show 2 magnitude increase but I would question those numbers and I suspect that this indicates nothing else just the worst kind of vibe-coding. Or perhaps it indicates exactly that: code generated without professional oversight and due care. Or they just have all the time on their hands? But I might be completely wrong here.[^fn-nth-2]

* Looking at the complexity comparison numbers the results are not so clear cut. It seems that AI assisted code is less modularised and files and functions are longer and more complex, but the signals here are mixed. There seems to be only a tendency to this, and likely way more data is required to find anything here.

## What's next?

On Mastodon people jumped on claude code and some folks even provided an extremely negative review of it ([Johhny](){:target="_blank"}). For good reasons I have to add. It would be really interesting to come up with a way to analyse code based on functionality provided. i.e.: these software metrics show us many things, but they don't establish a relation between `features_of_software <> metric(s)`. Maybe, here we can utilise a local LLM to pull out the number of features and their call stacks.

But that is for another day. I've already burned through multiple 5 hour limits and 1.5 weekly limit on this in the last 5 days :)

### Notes on the project

* *I'm not a UI person. I did websites "back in the day" yet it was fairly easy to have 10 UI prototypes drafted using the [user-interface-designer](https://skills.sh/qodex-ai/ai-agent-skills/user-interface-designer){:target="_blank"}.*
* *I'm not a UI person, yet I was able to quickly and effectively develop the UI to what it is at the moment. It is JS heavy (2k+ lines) and the `styles.css` is 1,300+ lines long but it's fairly ok to follow along.*
* *I'm not a UI person but having UI tests written with [Playwright](https://playwright.dev/){:target="_blank"} gave me the confidence to make drastic changes when it was needed.*
* *I'm not a UI person, but it was extremely easy to draft new pages, some of which I ended up using, most of them were just thrown away.* - IMHO, this was a really great thing: when having a working mock for an idea done in 15 minutes it becomes cheap. If it works, great, one can invest more minutes into it, otherwise just let it go.
* *Throwing the output of qlty onto the Genie made it easy to have the initial SQL schema created. It is a bit unnecessarily normalised which results in `JOIN` heavy queries but otherwise it was fine for the first time. Also, making large changes to the data model is cheap.* - having said that. At one point the unit tests were effectively duplicating the SQL queries in the test from the database layer. Without code review that would have stayed.
* *TDD is a must. I loved the promise when I was coding a lot, but it needs such a discipline, I rarely see it in practice. Also, I've seen lead engineer adding `assert(true)` to each test case, 'cause his code didn't pass ...* - now having those test cases done for all code is easy. Reviewing them? Not so much, but it is still quicker than writing by hand. I know this from previous AI assisted projects of mine already, but good to see it in action again.
* *Having multiple agents is an interesting experiment. I'm using Codex CLI with `gpt-5.3-codex` for my coding and planning needs (I don't like 5.4, it makes more mistakes) and I use Mistral's [vibe](https://github.com/mistralai/mistral-vibe){:target="_blank"} for reviewing plans and implementation.* - It is good fun to ask vibe for a review, placing it in a markdown file then asking codex to review the review.
* I've burned through multiple 5 hour limits, 1.5 of a weekly limit (at some point, I was so keen to carry on that now I have 2 seats on my company subscription. Hello :wave: Fianna Dray, you're doing good).
* Which brings me to the next point: the limit is not how quick the agent can work, but how quick I can think about the next step and how much I trust the generated code?
* Which I don't hence I approve every edit by hand. I'm old fashoined I know, and the code is mostly fine, but there were extremely silly mistakes generated which needed correcting early to avoid mess for future changes.
* **Burnout is real!** But I long not enjoyed myself this much. It is hard to stop when trying a new idea is cheap, when implementing the next feature is quick but one has to draw a line at some point.

[^footnote]: *If you have ideas how to develop this further or you're interested in using it in a business setting, reach out to me on zsolt_kulcsar at shibuyaltd.co.uk.*
[^fn-nth-2]: *Note: the `KLOC/week` for this project is `7.4` as of writing this.*
