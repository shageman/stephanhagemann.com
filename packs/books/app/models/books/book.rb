class Books::Book < ActiveHash::Base
  def to_param
    slug
  end

  self.data = [
    {
      id: 1,
      slug: "web20",
      title: "Unleashing Web 2.0: From Concepts to Creativity",
      authors: "Gottfried Vossen and Stephan Hagemann",
      cover_image: "/images/books/web20.jpg",
      date: "2007-07-28T12:00:00Z",
      amazon_link: "https://www.amazon.com/gp/product/B00BMEZQRK/ref=dbs_a_def_rwt_bibl_vppi_i1",
      tags: "web2",
      content: <<~TEXT
        The emergence of Web 2.0 is provoking challenging questions for developers: What products and services can our company provide to customers and employees using Rich Internet Applications, mash-ups, Web feeds or Ajax? Which business models are appropriate and how do we implement them? What are best practices and how do we apply them?

        If you need answers to these and related questions, you need Unleashing Web 2.0—a comprehensive and reliable resource that guides you into the emerging and unstructured landscape that is Web 2.0.
        
        Gottfried Vossen is a professor of Information Systems and Computer Science at the University of Muenster in Germany. He is the European Editor-in-Chief of Elsevier’s Information Systems—An International Journal. Stephan Hagemann is a PhD. Student in Gottfried’s research group focused on Web technologies.
        
        * Presents a complete view of Web 2.0 including services and technologies
        * Discusses potential new products and services and the technology and programming ability needed to realize them
        * Offers ‘how to’ basics presenting development frameworks and best practices
        * Compares and contrasts Web 2.0 with the Semantic Web
      TEXT
    },
    {
      id: 2,
      slug: "masszahlen",
      title: "Maßzahlen für die Assoziationsanalyse im Data Mining: Fundierung, Analyse und Test",
      authors: "Stephan Hagemann",
      cover_image: "/images/books/diplom.jpg",
      date: "2008-12-04T12:00:00Z",
      amazon_link: "https://www.amazon.com/gp/product/383665718X/ref=dbs_a_def_rwt_bibl_vppi_i3",
      tags: "",
      content: <<~TEXT
        Die Assoziationsanalyse ist innerhalb des Data Mining eine sehr populäre Methode zur Gewinnung von Wissen aus großen Datenmengen. Ihr Ziel ist die Gewinnung von wenn-dann-Regeln zwischen verschiedenen Objekten. Eine solche Regel bedeutet z.B. bei der Warenkorbanalyse, dass ein bestimmter Artikel häufig gekauft wird, wenn auch ein anderer Artikel häufig gekauft wird. Über die Zeit sind viele Maße zur Messung dieser Assoziation vorgeschlagen worden. Es fehlt im Data Mining jedoch an einer allgemeinen Definition wünschenswerter Eigenschaften für Assoziationsmaße. Eine solche Definition erlaubt aber erst den Vergleich verschiedener Maße unabhängig von konkreten Daten. In dieser Arbeit werden Ergebnisse aus früheren Arbeiten zu Assoziations- und Korrelationsmaßen als Grundlage für die Entwicklung einer Axiomatisierung für Maße in der Assoziationsanalyse genutzt. Die im Data Mining verwendeten Maße werden vorgestellt und auf die Erfüllung der neu definierten Eigenschaften hin untersucht. So werden die Maße im Hinblick auf ihre Anwendung in der Assoziationsnalyse fundiert. Mit Hilfe von Testdatenbanken wird untersucht, in wie fern sich die Erfüllung oder Nicht-Erfüllung der Eigenschaften in den Ergebnissen von Assoziationsanalysen niederschlägt. Dazu wird eine Reihe von sowohl qualitativen als auch quantitativen Beobachtungen verglichen. Es zeigt sich, dass sehr viele der in der Praxis verwendeten Assoziationsmaße einer theoretischen Untersuchung nicht standhalten.
      TEXT
    },    {
      id: 3,
      slug: "tag-based-mashups",
      title: "A Framework for the Consistent Usage of Tag-Based Mashups - Volume 105 Dissertations in Database and Information Systems",
      authors: "Stephan Hagemann",
      cover_image: "/images/books/doctor.jpg",
      date: "2010-01-15T12:00:00Z",
      amazon_link: "https://www.amazon.com/gp/product/1607500795/ref=dbs_a_def_rwt_bibl_vppi_i2",
      tags: "web2",
      content: <<~TEXT
        Mashups and social tagging are two of many aspects of recent developments on the Web and both are essential to this work. Mashups are Web applications that integrate data and functions from multiple Web sources. Social tagging is a form of free labeling, which is often used to annotate multimedia content on Web platforms. These two aspects are combined by showing how conventions in the usage of social tagging have created the possibility of controlling mashups with tags. In this work the development of an application for the creation and distribution of tag-based mashups is described. The application hooks into a Web browser and augments the Web surfing process with mashups based on the tags of the page on the fly. It thus adds relevant content to an original Web page. Application scenarios for the prototype are developed and it is examined how the underlying idea can be carried over into other contexts.
      TEXT
    },
    {
      id: 4, 
      slug: "cbra",
      title: "Component-Based Rails Applications: Large Domains Under Control",
      authors: "Stephan Hagemann",
      cover_image: "/images/books/components.jpg",
      date: "2018-06-22T12:00:00Z",
      amazon_link: "https://www.amazon.com/gp/product/B07DGK261T/ref=dbs_a_def_rwt_bibl_vppi_i0",
      tags: "",
      content: <<~TEXT
        Use Components to Improve Maintainability, Reduce Complexity, and Accelerate Testing in Large Rails Applications

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

        > This book gives Ruby pros a comprehensive guide for increasing the sophistication of their designs, without having to forsake the principles of elegance that keep them in our corner of the software world.
        — Obie Fernandez, author, The Rails™ 5 Way, Fourth Edition

        Today, we have better tooling to do this kind of work. gradualmodularization.com has the resources to get you started. I am publishing [Gradual Modularization for Ruby and Rails](/books/gradual-modularization/) on the topic! <span>&#128522;</span>
      TEXT
    },
    {
      id: 5, 
      slug: "gradual-modularization",
      title: "Gradual Modularization for Ruby and Rails",
      description: "Improve collaboration, system design, and flexibility",
      authors: "Stephan Hagemann",
      cover_image: "/images/books/packages.png",
      date: "2021-01-01T12:00:00Z",
      amazon_link: "https://leanpub.com/package-based-rails-applications",
      tags: "",
      load_stripe: true,
      payment_links: [
        {
          id: "buy_btn_1N6ujeJZs2anwJfpCugGlN1u",
          key: "pk_live_51LEBf2JZs2anwJfpShN64oaH4RSKdShWir3wDUa0vVT3sQC2aKDfjGUh8KhFP84fKGf21aeFrbpZpqlREgTi6wdC00uqUp6zx2",
          notes: "Ordering more than $200, $500, or $1000? Use discount codes <code>over200</code>, <code>over500</code>, <code>over1000</code> for 10%, 20%, and 30% discounts!"
        },
        {
          id: "buy_btn_1N77LKJZs2anwJfpitQVM8t3",
          key: "pk_live_51LEBf2JZs2anwJfpShN64oaH4RSKdShWir3wDUa0vVT3sQC2aKDfjGUh8KhFP84fKGf21aeFrbpZpqlREgTi6wdC00uqUp6zx2",
          notes: "Everything purchased via stephanhagemann.com is currently <strong>hand-delivered</strong>. I will get the purchase to you, but it might take me a bit depending if I am afk!"
        },
      ],
      content: <<~TEXT
        **WORK IN PROGRESS: You can buy the book right here. I also do book clubs with teams that buy the book. You can also the book [on Leanpub](https://leanpub.com/package-based-rails-applications). All book delivery will be through leanpub so you can follow along as I complete this book!**

        For the longest time, Ruby and Rails developers had gems and engines as their main tools for creating structure to manage large-scale structures within their applications. This book is about a new tool in their tool belt: packages.
        
        ## [Be sure to check out gradualmodularization.com](https://gradualmodularization.com)
        
        Based on the work on packwerk by Shopify packages allow a much more fluid move to modularization then components ever did. The effects are astounding: discussions about where to draw boundaries can be far less technical and focus more on the business because the underlying technology gets out of the way.
        
        The concept underlying this is gradual modularization, which the author expects we will see spread into other languages and frameworks over the coming years. Why? Because gradual modularization allows for a not-before seen level of approachability and flexibility to modularization work. Work that required difficult decisions that were hard to reverse changes. Those decisions are now the extreme points on a spectrum of options where the right thing for the team can be somewhere in between.
        
        This work is a continuation of [Component-based Rails applications](https://cbra.info) with superior tooling! I [wrote a book about that too](/books/cbra/) <span>&#128522;</span>
      TEXT
    },
  ]
end