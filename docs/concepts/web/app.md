# My Breakdown of a Web App
Today, we use the word _app._ For my purposes, these are fairly all synonymous terms:
+ Dynamic Web Site
+ Web Portal
+ Web App
+ Single Page App (with the obvious exception to serving pages)

## Purpose
+ Authenticated Users, ...
+ Store Critical Data, ...
+ Purchase Licensed IP, ...
+ To Create Personalized PDF charts, ...
+ which figure prominently in our users' revenue-generating engagements

## Architecture

### MVC
As our solution has
evolved, so has my understanding of the strengths and weaknesses of my implementation of the 
MVC pattern. Drawing lines between responsibilities is easy. Actually constructing those lines
out of code, well - that's the difference between watching a season of _This Old House_ and 
participating effectively at a Habitat for Humanity job site to build a house. 

### REST
At about the same time I went all in with MVC, I discovered the RESTful method. Now, for various reasons
I conflated the application of RESTful routes with the requests for viewing pages. Rookie mistake. 

### Entry Points
Separate entry points are required for serving views, data, and charts.

Entry Point | Purpose
--- | ---
__view__    | source of instructions/recipes for creating views for the user
__data__    | source of all raw data tx/rx server 
__chart__   | page from which a PDF is presented to the browser to be opened or downloaded

Here's the thing - they each implement a variation of a RESTful API. The rookie mistake was in attempting to 
accommodate _the entire app_ using a single landing page. I had been trying to get html, json data, and PDF  content
from the same entry point. 

Now, this can be done. I've done it. It works. But the implementation is so muddled with conditional execution that 
it no longer passes my sniff test (that's a personal thing, dont try to install that with npm or apt).



## Assimilation

+ [on Models](onModels.md)
+ [on Views](onViews.md)
__on Controllers__



