class User
  include Mongoid::Document

  field :name
  embeds_many :follows
  has_many :upvotes

  def feed
    followed_books = follows.map(&:author).map(&:books)
    upvoted_books = upvotes.map(&:book)
    feed = (upvoted_books + followed_books).uniq
    # feed.sort_by
  end
end
