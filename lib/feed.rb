class Feed

  attr_reader :user
  def initialize(user)
    @user = user
  end

  def retrieve
    followed_books = user.follows.map(&:author).map(&:books)
    upvoted_books = user.upvotes.map(&:book)
    (upvoted_books + followed_books).uniq
  end
end
