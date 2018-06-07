require 'faker'
require_relative '../../seed'

describe User do
  user = User.first
  book = Book.all.sample
  author = Author.all.sample

  describe ".followed_author_books" do
    it "returns an array of books by authors the user has followed" do
      user.follows.create!(author: author)
      expect(user.followed_author_books.map(&:id)).to include(author.books.map(&:id).sample)
    end
  end

  describe ".upvoted_books" do
    it "returns an array of books the user has upvoted" do
      user.upvotes.create!(book: book)
      expect(user.upvotes.map(&:book_id)).to include(book.id)
    end
  end
end
