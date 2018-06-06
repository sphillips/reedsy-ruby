require 'faker'
# require 'date'
require_relative '../../seed'

describe Feed do
  user = User.first
  feed = Feed.new(user)

  describe ".retrieve" do
    it "returns a feed of books, sorted by published_on date" do
      expect(feed.retrieve).to eq([])
    end
  end
end
