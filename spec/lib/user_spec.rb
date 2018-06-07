require 'faker'
require_relative '../../seed'

describe User do
  user = User.first

  describe ".followed_books" do
    it "returns an array of books by authors the user has followed" do
      follows = user.follows
      expect(follows.count).to eq(1)
      expect(follows.first.author).to eq(Author.first)
    end
  end

  describe ".upvoted_books" do
    it "returns an array of books the user has upvoted" do
      upvotes = user.upvotes
      expect(upvotes.count).to eq(3)
      expect(upvotes.first.book).to eq(Book.first)
    end
  end
end
