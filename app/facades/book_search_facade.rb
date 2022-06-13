class BookSearchFacade
  def self.get_books_details(location, quantity)
    found_books_details = BookSearchService.find_books_by_params(location, quantity)
  end
end