class Book < ActiveHash::Base
  self.data = [
    {
      id: 1, 
      title: "Component-Based Rails Applications: Large Domains Under Control",
      authors: "Stephan Hagemann",
      cover_image: "/images/books/components.jpg",
      date: "2018-06-22T12:00:00Z",
      amazon_link: "https://www.amazon.com/gp/product/B07DGK261T/ref=dbs_a_def_rwt_bibl_vppi_i0",
      tags: "",
      text: <<~TEXT
        Use Components to Improve Maintainability, Reduce Complexity, and Accelerate Testing in Large Rails Applications

        > This book gives Ruby pros a comprehensive guide for increasing the sophistication of their designs, without having to forsake the principles of elegance that keep them in our corner of the software world.
        — Obie Fernandez, author, The Rails™ 5 Way, Fourth Edition

        As Rails applications grow, even experienced developers find it difficult to navigate code bases, implement new features, and keep tests fast. Components are the solution, and Component-Based Rails Applications shows how to make the most of them.

        Writing for programmers and software team leads who are comfortable with Ruby and Rails, Stephan Hagemann introduces a practical, start-to-finish methodology for modernizing and restructuring existing Rails applications.

        One step at a time, Hagemann demonstrates how to revamp Rails applications to exhibit visible, provably independent, and explicitly connected parts—thereby simplifying them and making them far easier for teams to manage, change, and test. Throughout, he introduces design concepts and techniques you can use to improve applications of many kinds, even if they weren’t built with Rails or Ruby.

        * Learn how components clarify intent, improve collaboration, and simplify innovation and maintenance
        * Create a full Rails application within a component, from first steps to migrations and dependency management
        * Test component-based applications, manage assets and dependencies, and deploy your application to production
        * Identify the seams in an existing Rails application, and refactor it to extract components
        * Master a scripted, repeatable approach for refactoring Rails applications of any size
        * Use component-based Rails with two popular structural patterns: hexagonal and DCI architecture
        * Leverage your new component skills with other frameworks and languages
        * Overcome the unique challenges that arise as you componentize Rails applications

        If you’re ready to simplify and revitalize your complex Rails systems, you’re ready for Component-Based Rails Applications.

        Today, we have better tooling to do this kind of work. gradualmodularization.com has the resources to get you started. I am publishing [Gradual Modularization for Ruby and Rails](/books/gradual-modularization/) on the topic! <span>&#128522;</span>
      TEXT
    }
  ]
end