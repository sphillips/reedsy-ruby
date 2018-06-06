class User
  include Mongoid::Document

  field :name
  embeds_many :follows
  has_many :upvotes
end
