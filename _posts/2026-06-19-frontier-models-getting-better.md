---
date: 2026-06-19
title: How are the frontier models getting better all the time?
tags:
  - AI
  - Code
  - Analysis
categories:
  - AI Assisted Engineering
  - Training
---

**TL;DR:** The vendors do have access to all our prompts and the generated code. They just need to analyse, classify and use that data to train their models. Simples. i.e.: we are paying them for the privilege of having our knowledge exploited.

When I started my journey back to software engineering in October 2025 it was obvious that I have to use AI agents for my work. The horse bolted and we can shut the barn door but that won't make a difference. I started with my simple test project (for historical perspective: [zskulcsar/linux-rag](https://github.com/zskulcsar/linux-rag)) and it was exciting, it was fast. I jumped on the bandwagon of SDD ([Spec Driven Development](https://github.com/github/spec-kit/blob/main/spec-driven.md)) as it is appealing: you write the specs, the agent does the planning, you modify the plan, then we go for execution.

It was exciting, it was fast, but boy it was a disaster. But I learned a lot, mostly about what not to do, and the pitfalls one can encounter. So I tried again with a slightly modified SDD, being more methodical, spending more time on reviewing, slowing things down. (Again, for historical perspective only: [zskulcsar/linux-rag-t2](https://github.com/zskulcsar/linux-rag-t2)). Better but not exactly great.

Two lessons I learned: SDD is a mirage (what was I even thinking? The idea behind SDD is the same thing that drives waterfall and the [Rational Unified Process](https://en.wikipedia.org/wiki/Rational_unified_process) to the ground and if we learned anything over the years it is that it can't work, simply because one doesn't know till one doesn't know. Software development is, in many ways an experimental process. We have patterns and best practices, but we never really know what comes out at the end.) Anyway, you can read some better organised criticism of SDD on Martin Fowler's: [Understanding Spec-Driven-Development: Kiro, spec-kit, and Tessl](https://martinfowler.com/articles/exploring-gen-ai/sdd-3-tools.html).

The other learning was that the models are not exactly great. They do an okay-ish job of generating code. They are an extremely valuable learning tool, but there were just way too many mistakes to correct.

Then at the end of the year new frontier models came out and suddenly everyone was raving about how good they are. By that point I dropped pure SDD, but retained the "think it through up front"; I found skills before people jumped on skills, had a better feel of how to prompt and I experienced the same: the new models are much, much better than the old ones. I kept rolling, did side projects, worked on my main project and all was good.

But there was one question at the back of my mind. How is it that all of a sudden the frontier models are getting much better at the same time? Surely, their training methods and their architecture are closely guarded company secrets. Yet, everyone was saying how much better they are no matter what model they were using. Not counting industrial espionage and parallel discovery, which are likely at play, what is the reason?

This was ticking in my head, when suddenly it hit me: when we are using the tools, we are effectively labelling the data. Sure, the AI labs are paying a hell of a lot of money to data labelling companies to create the training dataset and that data is easy to use, but there must be a way of using our own prompts and outcomes to create training data (I know, the AI labs are stating that they don't use our data to train their models, but I'm equally convinced that there are ways to work around that restriction). After all, they see the prompts, they see the results, they can infer what is good and what is bad in the eyes of the human. If the code stays in the repo, that's good. If not, it's not good.
Also, there is clear correlation between a feature and the code generated for that. That's a thorny problem because most of the code doesn't have the related feature description and evolution of said feature tightly linked: the Jira tickets are not with the code. This is especially true for open source projects and the closed source data can't be used for obvious reasons.

Of course this has to be more nuanced, but absolutely not impossible.

Anthropic published its own research on [Agentic coding and persistent returns to expertise](https://www.anthropic.com/research/claude-code-expertise) on the 16th, and it is a fascinating read, not because of its conclusions. In fact, I would say that the outcome is kinda stating the obvious. Sure, science sometimes has to state obvious things and it puts data behind the insight and that is extremely valuable, and that it is still science nonetheless.
It is a fascinating read because it gives us insight into how data is being labelled. It confirms that we, who are paying for these tools, are actually doing that work.

I'm not saying that the frontier labs are in breach of their terms and conditions. I'm sure they are working really hard to avoid lawsuits to that effect, but it is revolting to see the worst of capitalist exploitation in action. Again.
