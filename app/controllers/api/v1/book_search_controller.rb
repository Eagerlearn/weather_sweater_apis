class Api::V1::BookSearchController < ApplicationController
  def index
    book_details = BookSearchFacade.get_books_details(params[:location], params[:quantity])
  end
end
