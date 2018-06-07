class Feed

  attr_reader :user
  def initialize(user)
    @user = user
  end

  def retrieve
    # fetch user's follows and upvotes, and de-dupe
    feed = (user.followed_books + user.upvoted_books).uniq
    # order by published date DESC
    feed.sort_by(&:published_on).reverse
  end
end
