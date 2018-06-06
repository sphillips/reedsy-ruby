class Upvote
  include Mongoid::Document

  belongs_to :user
  belongs_to :book, counter_cache: true
end
