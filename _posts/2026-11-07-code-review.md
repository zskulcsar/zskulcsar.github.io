---
date: 2026-11-07
title: An idea on Code Review.
tags:
  - AI
  - PDD
  - Quality
  - Agents
  - Code Review
categories:
  - AI Assisted Engineering
---

I've read a blog titled [Writing as a thinking tool](https://muratbuffalo.blogspot.com/2026/11/writing-as-thinking-tool.html) that kept me thinking.

At some point in my software engineer career I started to write READMEs and documentation. Generally developers don't like to type out long texts (the irony ...) but I realised that it helps me to create better software. First, I have to understand what the software does, then I have to put it into words. Also, when thinking about how to write what I know, kept realising how stupid the implementation is.
It's painful as I have to go back and change the implementation so that it doesn't sound that stupid anymore, but over time I learned to love the process. There is satisfaction in reviewing your own code, poking holes and seeing it getting better.

## Pivot.

One of the new unresolved questions is how to handle code reviews? Back in the distant past code-review and pull-request were not universal practices. Then when GitHub came about they offered branches, pull-requests and code-reviews. It was quickly adopted as a means to guarantee internal consistency and quality. Some teams did this better, others worse, but the tool itself was a reasonable attempt to enforce rules.

These days when the agents are generating lots of code the code-review is not trivial and is starting to lose its relevance. People are still asking, "what now?" and they are giving various answers. (It is worth reading Gergely Orosz's post at _https://newsletter.pragmaticengineer.com/p/what-is-happening-with-code-reviews_) Some don't even look, some look based on size, relevance, risk, some use automation. I'm facing the same problem and even entertained the idea of developing a tool that supports code reviews on the basis that code is less important, what matters are the architectural changes. Think about diagrams showing what effect the changes do have on the architecture?

But perhaps there is a third approach: what if we enforce the developer to write a summary of the changes by hand? Take the changed code, review and understand before PR and write a mini readme for the changeset. I think you see where I'm heading with this. If writing requires understanding, then we can enforce that by mandating summary.

There are many ways to cheat (wrong answers only), but maybe there is something here, assuming we want engineers to understand what they are working with.

But perhaps that is the whole point. If [PDD](/tags/pdd/) can be done by anyone, but productionising still needs engineers, then surely these engineers need to understand the system otherwise what is the point of having them?
