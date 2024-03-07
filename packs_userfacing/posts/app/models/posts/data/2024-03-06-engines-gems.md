---
title: "Engines and Gems: Destination. Not path."
tags:
  - gradual modularization
  - gems
  - engines
---

Ten years ago, I wrote [Component-based Rails Applications](/books/cbra/). Today, on [cbra.info](https://cbra.info/), I have this banner: "I consider the CBRA approach deprecated. Gradual modularization based on packages gives us all the benefits of components (and more) for much lower costs." 

Gems and engines still play an important role, just ==not as the path but rather as the destination==.

<!--more-->

I wrote yesterday in [What is the modularization destination for large apps?](/posts/2024-03-05-modularity-destination) that the destination for every package in a gradual modularization context wants to be either application or library. As part of that argument, I shared this diagram containing three significant points on the gradual modularization extraction axis:

![Diagram of a Continuum from *not extractable* to *extractable* to *extracted*](/images/posts/2024-03-05-continuum.png "Continuum from *not extractable* to *extractable* to *extracted*")

I can use this axis to explain why the CBRA approach for getting to extracted code should be deprecated. Adding the space in which packages and gems work well, the following comes up for me:

![Packages and gems in relation to the extraction continuum](/images/posts/2024-03-06-continuum-gems-packages.png "Packages and gems in relation to the extraction continuum")

The green areas are where the technology shines. I am using the gradient to indicate where I think the technology gains or loses its power.

## Packages

The first thing to note is that packages shine where we work toward extractability. That's obviously because of the ability to have, acknowledge, but not do anything about violations. I continue to believe that this is the core technical innovation [packwerk](https://github.com/shopify/packwerk) contributed to application architectural work. This capability allows packages to occupy the in-between space of entanglement and separation, the prerequisite to extraction.

As Gannon McGibbon writes in [A Packwerk Retrospective](https://shopify.engineering/a-packwerk-retrospective), when they tried to extract a package that didn't contain any violations, they couldn't do so immediately. They had to do more work to make it extractable because of entanglement that packwerk couldn't see. For this reason, I am starting the gradient for packages' before the axis reaches extractability. 

We know packwerk can not see a bunch of stuff:

1. Non-[zeitwerk](https://github.com/fxn/zeitwerk)-controlled code
2. Metaprogrammed class-references both in production code as well as in test code
3. Code in gems

Note that point no 3 is not what packwerk or gradual modularization are after at their core, but it is still interesting to add to the list (if only to inspire future thought of where the tooling and its usefulness might go)

It is important to note that both points no 1 and no 3 are solved by [pks](https://github.com/alexevanczuk/packs), a rust implementation of packwerk. The reason pks can do this is that it does not rely on zeitwerk to link filenames to and from constants. Instead, it parses all the files in the project (and optionally gems). And because it is built exploiting rust's ability to go fast... it is still faster than packwerk.

So, with pks instead of packwerk, we can push the gradient (the applicable area) for packages to the right.

Practices can also push the gradient of packages to the right. As two examples, look at these PRs on the repo for this website:

* [Make route file locations part of package public APIs](https://github.com/shageman/stephanhagemann.com/commit/5949ebf89a14473071d4b35f3342ac23b9240c63#diff-959bc9abc46a55332bb64d5155a79323afa75a50ec1a2137ddd22d926f62c6c5)

    This PR contains a new routes file that doesn't (directly) use string for [packaged-based route registration](https://github.com/rubyatscale/packs-rails?tab=readme-ov-file#splitting-routes). Instead, each package exposes a constant that the top-level routes file uses. That makes this connection visible to package boundaries and makes the system's internal structure more sensible in that it co-locates the ownership of routes and their entry point within one (the "owning") pack.

    * `config/routes.rb`:

      ```ruby 
      Rails.application.routes.draw do
        get 'up' => 'rails/health#show', as: :rails_health_check

        draw(Root::Config::ROUTE_FILE_NAME)

        draw(Books::Config::ROUTE_FILE_NAME)
        draw(Speaking::Config::ROUTE_FILE_NAME)
      end
      ```

    * `packs/books/app/public/config.rb`:

      ```ruby
      class Books::Config
        ROUTE_FILE_NAME = "books"
      end
      ```

* [Expose path helper for contact page via public API](https://github.com/shageman/stephanhagemann.com/commit/52776f33f731db9a15fba0b943fad7809f1e3a0a#diff-ef4a254a7af06605559474d0cf667c202d9fca178103a7e5299d17ce345aaf6f)

    This PR extends the idea of route ownership by exposing the routes to link to the entry point of a package via its public API. 

    * packs/books/app/public/config.rb:

      ```ruby
      class Contact::Config
        ROUTE_FILE_NAME = "contact"

        # Exposes path helper to root of contact page. You can pass in a subject as a param
        def self.entrypoint_path(subject)
          Rails.application.routes.url_helpers.contact_index_path(subject: subject)
        end
      end
      ```

I am currently enforcing this practice via convention rather than any tools. I will make it the topic for another day to discuss the tradeoff regarding this decision.

## Gems

The [Component-based Rails Applications](/books/cbra/) (CBRA) lays out how to use gems to create internal structure for Ruby and Rails applications. A whole host of companies have tried to make this approach work. Some do so successfully still today. Many did not make it work. They perceived the approach as too heavy-handed, too ceremony-laden.

One side of this heaviness is that in using gems for CBRA, we want only a portion of what gems offer and require. The part we don't need creates unnecessary overhead.

Today, I believe that the even greater hurdle is that gems don't help with extraction. The opposite is true: the extraction needs to have already happened for gems to be applicable because they don't offer tools to get to extractability. They do allow us to manifest it.

As such, I start drawing the gradient for gems at the point of the code's extractability. Moving to the right towards *extracted* is where we start to use all of gems' capabilities, and that is where gems shine.

