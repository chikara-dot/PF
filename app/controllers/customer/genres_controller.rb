class Customer::GenresController < ApplicationController
  def index
   @genres = Genre.all
  end
end
