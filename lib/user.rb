class User
  include Mongoid::Document

  field :name
  embeds_many :follows
  has_many :upvotes

  def followed_books
    follows.map(&:author).map(&:books).flatten
  end

  def upvoted_books
    upvotes.map(&:book)
  end
end
