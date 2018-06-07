require 'faker'
require_relative '../../seed'

describe Feed do
  user = User.first
  feed = Feed.new(user)
  author = Author.last
  book = Book.last

  describe ".retrieve" do
    it "returns an array of books, sorted by published_on date" do
      new_upvote = user.upvotes.create!(book: book)
      new_follow = user.follows.create!(author: author)
      feed_list = feed.retrieve
      expect(feed_list).to include(book)
      expect(feed_list).to include(author.books.first)
      expect(feed_list.first.published_on).to be > feed_list.last.published_on
    end
  end
end
