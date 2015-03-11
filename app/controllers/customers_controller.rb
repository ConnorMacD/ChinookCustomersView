class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def index
    @customers = Customer.limit(50)
  end


end