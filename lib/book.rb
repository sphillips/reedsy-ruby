class Book
  include Mongoid::Document

  field :title
  field :published_on, type: Date
  belongs_to :author
  has_many :upvotes
end
