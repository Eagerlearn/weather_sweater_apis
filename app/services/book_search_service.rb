class BookSearchService
  def self.conn
  x = Faraday.new('http://openlibrary.org', headers: {'Content-Type' => 'application/json'})
      require "pry"; binding.pry
  end

  def self.find_books_by_params(location, quantity)
    response = conn.get('/subjects') do |faraday|
      faraday.params[:location] = location
      faraday.params[:quantity] = quantity
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
