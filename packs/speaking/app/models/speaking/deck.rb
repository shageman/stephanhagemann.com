# typed: false
class Speaking::Deck < ActiveHash::Base
  self.data = [
    {
      id: 1,
      key: "tbd",
      title: "To be determined...",
      description: "Stay tuned for the details!",
      speakerdeck_slide_link: nil,
      speakerdeck_slide_embed: nil,
    },
    {
      id: 2,
      key: "gradualModularityWorkshop",
      title: "Gradually Modularizing your Monolith with Ruby Packs and Packwerk",
      description: "Are you struggling with large amounts of complexity in your application? A big org with lots of cross-team dependencies? Too much coupling, causing bugs and incidents? Difficult time ramping up new engineers? Or do you just want to improve product optionality by having more reusable building blocks to create new features for your customers?,<br><br>

      Join us to apply the packs ecosystem and packwerk to gradually modularize your application. We'll dive into decomposing your application, moving files into packs, and coming up with a technical and managerial plan to successfully roll this out to and get buy-in from the rest of your organization.
      ",
      speakerdeck_slide_link: "gradually-modularizing-your-monolith-with-ruby-packs-and-packwerk",
      speakerdeck_slide_embed: '<script defer class="speakerdeck-embed" data-id="deaad16f339545de9ebd56296b719a41" data-ratio="1.77725118483412" src="//speakerdeck.com/assets/embed.js"></script>',
    },
    {
      id: 3,
      key: "packwerk",
      title: "packwerk: a little dev utility ... and a total game changer",
      description: "Shopify released packwerk into open source in 2020. It may not have been around for long, but it is a game changer in how we can manage the complexities within our applications. It makes modularization work easier, more approachable, more iterable, and probably also more fun. With other approaches like micro services or gems and engines we need to have a lot of the answers when at the start. With packwerk we can start with an idea and learn along the way where we want to go and what we need to do to get there.<br><br>Let’s make some packages!",
      speakerdeck_slide_link: nil,
      speakerdeck_slide_embed: nil,
    },
    {
      id: 4,
      key: "gradualModularity",
      title: "Gradual Modularity",
      description: "Shopify released packwerk open source in 2020. It may not have been around for long, but it is a game changer in how we can manage the complexities within our applications. It makes modularization work easier, more approachable, more iterable, and probably also more fun. With other approaches like micro services or gems and engines we need to have a lot of the answers at the start. With packwerk we can start with an idea and learn along the way where we want to go and what we need to do to get there.

      Let's make some packages!",
      speakerdeck_slide_link: nil,
      speakerdeck_slide_embed: nil,
    },
    {
      id: 5,
      key: "structuralEngineeringRubyKeynote",
      title: "Structural Engineering in Ruby (Morning Keynote)",
      description: "",
      speakerdeck_slide_link: "structural-engineering-in-ruby",
      speakerdeck_slide_embed: '<script async class="speakerdeck-embed" data-id="8bee3a170abd4b3996db3b3b67e75e2b" data-ratio="1.77777777777778" src="//speakerdeck.com/assets/embed.js"></script>',
    },
    {
      id: 6,
      key: "componentBasedArchitecturesRuby",
      title: "Component-based Architectures in Ruby and Rails",
      description: "It's true that goods are better distributable when they are in packages. That is the common view of what Ruby gems and Rails engines are: packages for distribution. This perception misses the great value that comes from packaging without distribution. That is what makes component-based architectures: a helpful tool for organizing growing codebases. We'll talk about how to do this with (and without) Ruby on Rails.<br><br>Ruby makes it a bit hard to do packages right: you really can't hide anything. Rails doesn't want you to do it. I don't care. We'll do it anyways and it will be awesome!",
      speakerdeck_slide_link: "component-based-ruby-and-rails-architectures-at-mountain-west-ruby-2013",
      speakerdeck_slide_embed: '<script async class="speakerdeck-embed" data-id="8c0433e080fc0130d4781231381aa0f1" data-ratio="1.2994923857868" src="//speakerdeck.com/assets/embed.js"></script>',
    },
    {
      id: 7,
      key: "wranglingLargeRubyCodebases",
      title: "Wrangling Large Rails Codebases",
      description: "",
      speakerdeck_slide_link: "wrangling-large-ruby-codebases-at-rocky-mountain-ruby-2012",
      speakerdeck_slide_embed: '<script async class="speakerdeck-embed" data-id="5060f3e78126750002016b1d" data-ratio="1.2994923857868" src="//speakerdeck.com/assets/embed.js"></script>',
    },
    {
      id: 8,
      key: "getStartedWithComponents",
      title: "Get started with Component-based Rails applications!",
      description: "Component-based Rails helps you regain control over your sprawling Rails application. It helps you structure your new Rails application in a way that it will stay more manageable longer. It helps you think completely differently about writing applications - not just in Ruby and Rails!<br><br>This session will help you pass the initial hurdle of getting started with component-based Rails. While there is nothing really new, there is a lot that is just a little different. We will go over those differences so your start with component-based Rails is a smooth one.",
      speakerdeck_slide_link: "get-started-with-component-based-rails-at-railsconf-2015",
      speakerdeck_slide_embed: '<script async class="speakerdeck-embed" data-id="925ecb74a51a48b2a711bd24b954daa5" data-ratio="1.77777777777778" src="//speakerdeck.com/assets/embed.js"></script>',
    },
    {
      id: 9,
      key: "refactoringTowardsComponents",
      title: "Refactoring Towards Component-based Rails",
      description: "You have a big Rails app and are feeling the pains? Stories are hard to deliver, code is hard to refactor, and your tests take a looong time? Getting you and your codebase out of this situation requires you to stop developing a 'Rails application' and start refactoring towards your domain. I will discuss how and where you refactor towards a more structured and manageable application, a component-based Rails architecture.<br><br>For his day job Stephan is a Pivot - developing software at Pivotal Labs. With every project he especially enjoys the continuous search for doing the right thing, and doing that right. Outside of that he enjoys more work: on his old house or his rock climbing skills.",
      speakerdeck_slide_link: "refactoring-towards-component-based-rails-architectures-at-railsconf-2014",
      speakerdeck_slide_embed: '<script async class="speakerdeck-embed" data-id="c7d4f140ad69013183623ab2b4f1ac72" data-ratio="1.77777777777778" src="//speakerdeck.com/assets/embed.js"></script>',
    },
    {
      id: 10,
      key: "whatWhyHowComponents",
      title: "The What, Why, And How of Software Components - In Ruby and Beyond",
      description: "With components your apps will be happier, healthier, and development will be more fun. Let me show you how!<br><br>Components add a layer of structure that is not present in many applications. The structure in question is that of bounded contexts. Bounded contexts with boundaries enforced and tests separated. If you have thought that your app is too big and that the way to save it is micro services, you may want to take it one step slower and look at components first. In Ruby, we create component-based apps with gems; in Rails, we add engines.<br><br>The technology is one thing - there is a lot to consider there. This talk will quickly cover the tech and dive deeper into the what, the why, and how of component-based application development.",
      speakerdeck_slide_link: "software-components-at-rug-b",
      speakerdeck_slide_embed: '<script async class="speakerdeck-embed" data-id="562334cacf014e65b8d3b48db14299ec" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>',
    },
    {
      id: 11,
      key: "productionizeServices",
      title: "Productize Your Services! A Path Towards Effective Microservice Development",
      description: "Moving to a microservices architecture is not just a technology problem. With the level of tooling and support we get from Spring and platforms like Cloud Foundry, the really daunting tasks quickly move to organizational challenges. How does one find and define the organization’s shared services? What are their boundaries? How should they get distributed? In this talk we will use the Spring Framework’s great support for building services infrastructures, harness the superpowers of PaaS for scalable deployment, and combine this with Lean and Agile principles of product development to lay out a blueprint for how organizations can reason about and develop their service architectures effectively.",
      speakerdeck_slide_link: "productize-your-services-at-springone-2017",
      speakerdeck_slide_embed: '<script async class="speakerdeck-embed" data-id="f3a19c5c58804303a31030ff1c76de3a" data-ratio="1.77777777777778" src="//speakerdeck.com/assets/embed.js"></script>',
    }
  ]
end
