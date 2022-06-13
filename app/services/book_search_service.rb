class BookSearchService
  def self.conn
    Faraday.new('http://openlibrary.org') do |faraday|
    end
  end

  def self.find_books_by_params(location, quantity)
    response = conn.get('/search.json') do |faraday|
      faraday.params['q'] = location
      # getting nil returned for response, connection appears to work, but not reaching endpoint
      # attempted multiple ways to convert to json (assumed that was the issue) unsuccessfully
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
