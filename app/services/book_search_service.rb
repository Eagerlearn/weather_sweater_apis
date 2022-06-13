class BookSearchService
  def self.conn
    Faraday.new('http://openlibrary.org') do |faraday|
    end
  end

  def self.find_books_by_params(location, quantity)

  end
end
