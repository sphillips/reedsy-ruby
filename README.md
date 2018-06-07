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
> require '/.seed'
```

#### Question 3
Payment Factory

#### Question 4
Recommendation System

#### Question 5 (Bonus)
Implement recommendation system
