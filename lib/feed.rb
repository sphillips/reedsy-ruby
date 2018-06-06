class Feed

  attr_reader :user
  def initialize(user)
    @user = user
  end

  def retrieve
    user.feed
  end
end
