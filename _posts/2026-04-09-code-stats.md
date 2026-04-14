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

**TL;DR:** I built a small project in a few days to compare code metrics across AI-assisted and non-AI-assisted open-source projects. You can explore it at [csq.shibuyaltd.co.uk](https://csq.shibuyaltd.co.uk/){:target="_blank"}.

## Preamble

A few days ago, the complete source code of [Claude Code leaked](https://thehackernews.com/2026/04/claude-code-tleaked-via-npm-packaging.html){:target="_blank"} in a funny way. I jumped on the opportunity and took a look, but I wasn't that interested in the obvious questions like: *"Is it secure?"* or *"What are the new features?"*. Plenty of people will analyse the code and draw their own conclusions. For me, the interesting part is the model, not the harness: we already have plenty of harnesses on GitHub.

Having said that, Anthropic claims that Claude Code is written by agents, and OpenAI says similar things about Codex. More broadly, vendors are pushing the narrative that **"development is solved"** and that engineers are now better off switching professions because agents will write all the code.

So here we have at least two questions to answer:
* Is agentic coding quicker?
* Does agentic coding produce production quality code?

## Is it quicker?

That's a simple thing to answer, we just need to calculate `LOC / project_duration_in_weeks / nr_of_contributors` and compare it to other projects that are known for not using AI.

## Is it production quality?

Now, that's a bit trickier. After all, it's just a bunch of text, so how does one even compare one project to another? Luckily, this is a topic I've been interested in for most of my professional career. At this point, that's a good 20+ years. I won't go into details here, but [Wikipedia](https://en.wikipedia.org/wiki/Software_metric) is always a good starting point if one wants to bore oneself with the topic.

## How did this madness start?

It started with answering the first question:
* `LOC` - easy, just get the code, run [qlty](https://github.com/qltysh/qlty){:target="_blank"} on said code and one has the metrics. *(and the errors, the warnings, etc.)*
* `project_duration_in_weeks` - that's not so easy, but not impossible. As Claude Code is closed source we can only go by the [changelog](https://code.claude.com/docs/en/changelog){:target="_blank"} which starts with *0.2.21* at 02/04/2025.
* `nr_of_contributors` - again, closed source so hard to tell. But one can use the tools of the adversary and both ChatGPT and LeChat give a reasonable answer based on all sorts of sources putting the range between 5 to 25.

Running those numbers we end up with:

| nr. of engineers | LOC/week |
| --- | --- |
| 5 | 2,000 |
| 10 | 1,000 |
| 25 | 400 |

### But how does this compare?

So I've asked ChatGPT, LeChat and Gemini about *"average LOC/week for a mid level engineer"*. I know, this is the worst possible thing to do and I'm ashamed of myself, but the good thing with statistics is that at the end they can tell the truth.

The combined answer is roughly like this:
* *"A mid-level engineer is not expected to hit a specific LOC number. If you forced a rough heuristic, ~200–800 LOC/week is a loose observational range—but any team using that as a KPI is likely measuring the wrong thing."* - says ChatGPT
* *"For a mid-level engineer, 500–1,500 LoC/week is a reasonable benchmark in most industries, but context matters more than raw numbers. At companies like Anthropic, AI tools may push this significantly higher, but the focus remains on value delivered, not lines written."* - states LeChat (but also gives us some interesting ranges: 500 - 2,000 based on studies; 1,000 - 1,500 by MS internal data; 200 - 1,200 by Google; 1,500 - 3,000 in startups)
* Gemini? The answer is **Yes!** as Gemini being Gemini.

So, based on the numbers above, the vendor claims don't really hold up and the picture looks closer to what researchers have been finding. But I've used these tools enough that I still find that hard to believe, because my own experience feels different. Caveat emptor: I'm using them in a not-exactly-professional setting, with no meetings, no discussions, no office politics, and no ever-changing priorities.

Also, LOC/week is a hard measure. As in: no engineer wants this measured for good reasons.

I've spent another hour combing through open source projects, cloning them, running `qlty metrics -a`, figuring out project timelines, eyeballing average number of contributors and compiling the numbers. Lo and behold, the ballpark numbers didn't even reach 100 lines per week for the projects I gauged.

That's not good. That is really not good.

## Where did we end up?

So, on 2nd of April I spun up Codex and started to AI Engineer my way into this madness: **to compare apples-to-apples based on real data**. You can see the result at [csq.shibuyaltd.co.uk](https://csq.shibuyaltd.co.uk/){:target="_blank"}. Feel free to play and draw your own conclusions.[^footnote]

## My conclusion?

Not much, based on the limited number of projects I used.

* Clearly, **AI assisted coding is significantly faster**.  
  At least an order of magnitude faster, i.e. one more zero at the end. Some projects even show a two-order-of-magnitude increase, but I would treat those numbers with caution. That may point to the worst kind of vibe-coding, or simply to code generated without much professional oversight and due care. Or maybe those people just have more time on their hands. I might be completely wrong here.[^fn-nth-2]

* Looking at the complexity comparison numbers the results are not so clear cut. It seems that AI assisted code is less modularised and files and functions are longer and more complex, but the signals here are mixed. There only seems to be a tendency in this direction, and likely way more data is required to find anything here.

## What's next?

On Mastodon, people jumped on Claude Code, and some folks even provided an extremely negative review of it ([Jonny@neuromatch.social](https://neuromatch.social/@jonny/116326861737478342){:target="_blank"}). For good reasons, I should add. What would be really interesting next is a way to analyse code against the functionality it provides. These software metrics show us many things, but they do not establish a relationship between `features_of_software` and the metric values. Maybe a local LLM could help pull out the features and their call stacks.

But that is for another day. I've already burned through multiple 5 hour limits and 1.5 weekly limit on this in the last 5 days :)

### Notes on the project

A few notes that match what I've seen elsewhere too:

* *I'm not a UI person. I did websites "back in the day", yet it was straightforward to have 10 UI prototypes drafted using the [user-interface-designer](https://skills.sh/qodex-ai/ai-agent-skills/user-interface-designer){:target="_blank"}.*
* *The current UI came together quickly and effectively. It is JS heavy (2k+ lines) and the `styles.css` is 1,300+ lines long, but it's fairly easy to follow along.*
* *Having UI tests written with [Playwright](https://playwright.dev/){:target="_blank"} gave me the confidence to make drastic changes when it was needed.*
* *Drafting new pages was cheap. Some I ended up using, most of them were just thrown away.* - IMHO, this was a really great thing: when having a working mock for an idea done in 15 minutes it becomes cheap. If it works, great, one can invest more minutes into it, otherwise just let it go.
* *Throwing the output of qlty onto the Genie made it easy to have the initial SQL schema created. It is a bit unnecessarily normalised which results in `JOIN` heavy queries but otherwise it was fine this time around. Also, making large changes to the data model is cheap.* - Having said that, at one point the unit tests were effectively duplicating the SQL queries in the test from the database layer. Without code review that would have stayed.
* *TDD is a must. I loved the promise when my job was coding, but it requires such a discipline, I rarely see it in practice. Also, I've seen a lead engineer add `assert(true)` to each test case, 'cause his code didn't pass ...* - Now having those test cases done for all code is easy. Reviewing them? Not so much, but it is still quicker than writing by hand.
* *Having multiple agents remains an interesting experiment. I'm using Codex CLI with `gpt-5.3-codex` for my coding and planning needs (I don't like 5.4, it makes more mistakes) and I use Mistral's [vibe](https://github.com/mistralai/mistral-vibe){:target="_blank"} for reviewing plans and implementation.* - It is good fun to ask vibe for a review, placing it in a markdown file, then asking codex to review the review.
* I've burned through multiple 5 hour limits, 1.5x weekly limit (at some point, I was so keen to carry on that now I have 2 seats on my company subscription.)
* Which brings me to the next point: the limit is not how quick the agent can work, but how quick I can think about the next step and how much I trust the generated code?
* Which I don't, hence I approve every edit by hand. I'm old fashioned, I know, and the code is mostly fine, but there were extremely silly mistakes generated which needed correcting early to avoid mess for future changes.
* **Burnout is real, as ever!** But I haven't enjoyed myself this much in a long time. It is hard to stop when trying a new idea is cheap, when implementing the next feature is quick but one has to draw a line at some point.

[^footnote]: *If you have ideas how to develop this further or you're interested in using it in a business setting, reach out to me on zsolt_kulcsar at shibuyaltd.co.uk.*
[^fn-nth-2]: *Note: the `KLOC/week` for this project is `7.4` as of writing this.*
