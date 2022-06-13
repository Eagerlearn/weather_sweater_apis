class BookSearchService
  def self.conn
    Faraday.new('http://openlibrary.org')
  end

  def self.find_books_by_params(location, quantity)
    response = conn.get('/subjects/', headers: {'Content-Type' => 'application/json'}) do |faraday|
      faraday.params[:name] = location
      faraday.params[:work_count] = quantity
      # require "pry"; binding.pry
      # getting nil returned for response, connection appears to work, but not reaching endpoint
      # attempted multiple ways to convert to json (assumed that was the issue) unsuccessfully
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
