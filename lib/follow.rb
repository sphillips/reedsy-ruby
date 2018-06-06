class Follow
  include Mongoid::Document

  embedded_in :user, inverse_of: :follows
  belongs_to :author
end
