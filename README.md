# Reedsy Developer Challenge
Instructions found [here](https://github.com/reedsy/challenges/blob/master/ruby-on-rails-engineer.md)

#### Question 1
**About me:** My web development career spans about ten years, beginning at a digital agency in Manhattan and working my way through several startups, both as a team member and as a team lead, wherein I helped my most recent company scale from one developer to a team of eight. I think my wide range of experience and an academic background in finance and business management gives me the ability to adapt to working in any industry or developer role. I have been working with Ruby on Rails my entire career but have recently been working on React apps and familiarizing myself with the current JS landscape as the industry evolves. More of my technical details and achievements can be found in [my CV](https://standardresume.co/seanp). I'm generally attracted to creative fields: aside from web development, I have a life-long passion for music and I currently have a side career as a music producer and label runner.

#### Question 2
**Implement Feed Generator**
Since I'm used to typically building in Rails + ActiveRecord, I decided for this task to use a simple app framework with an ORM. I felt like Rails/PG would be overkill for this so I chose Sinatra + MongoDB. This enabled me to write a seed script and define object relations for the queries. From there I simply added the query methods on the `User` class and write the retrieve method on the `Feed` class.

To test the app run `rspec` from the root folder:
```
$ rspec
```
Or to dig into the code further:
```
$ irb
> require './seed'
> User.first.follows
=> [#<Follow _id: 5b18f6dcd5aedb0b017c0544, author_id: BSON::ObjectId('5b18f6dcd5aedb0b017c053e')>]
```

#### Question 3
**Design a Payment Factory**
When designing a payment processing system for e-commerce, in order to maintain flexibility and SOLID principles, the data should be normalized as much as possible before sending to the payment processing API. For instance, we could build a class which assembles the order data from the shopping cart into an `Order` object, containing the relevant information:
```
order: {
  id: '0b017c053e',
  user_id: '5b18f6dcd5',
  total_price: 1500,
  currency: 'eur',
  line_items: [
    {
      book_id: '5b18f6dcd5',
      price: 1500
    }
  ]
}
```
In most cases this is the bare minimum for the payment processing API (the line items aren't necessary to process the payment but will be used on the confirmation page and/or in a confirmation email).

Next I would create a class for each payment method type because each payment type is handled differently. This design also allows for new APIs to be added in the future without having to modify the order system. For instance, for credit card transactions I would create a `StripePayment` class which parses the data from the `Order` object into the payload which will be transmitted to the Stripe API, and receive a response which is then passed onto the next piece of the chain, like the controller to redirect the user to the confirmation page or possibly a `PaymentResponse` class if we need that data to be handled a certain way, like structuring the confirmation email.

#### Question 4
**Recommendation System**
For a book recommendation system, I would take inspiration from the [Spotify Algorithm](https://qz.com/571007/the-magic-that-makes-spotifys-discover-weekly-playlists-so-damn-good/) which works remarkably well at recommending new or unheard music to users. There are a couple heuristics at play here, which bear similarities to other widely referenced recommendation engines.

One is that it takes data from users, compiling their taste profile from their playlists and plays. For our book shop example, we could take a user's follows and upvotes to compile data on their tastes, and find other users with similar profiles to find books/authors that our user has not followed or upvoted yet. This is similar to Amazon's "other users also purchased" system.

Another trick to getting the recommendations right is by using granular genres, like "gritty dystopian sci-fi" as opposed to a broad term like "sci-fi". This is similarly used by Netflix to nail down users' tastes and differentiate from broader recommendations.

These two variables in conjunction build a very strong taste profile for a user. If we also choose to add weights certain tastes based on the number of upvotes or follows by a user in a given genre, and incorporate a user's browsing history to see if they have already viewed a book, we can further refine the accuracy for recommendations of books for the user that they are likely to enjoy but have not yet viewed.
