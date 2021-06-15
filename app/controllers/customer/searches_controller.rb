class Customer::SearchesController < ApplicationController

  def search
    word = params[:search][:word]
    @customers = Customer.search(word)
  end

end
