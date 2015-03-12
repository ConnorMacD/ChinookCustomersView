class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def index
    @customers = Customer.where(SupportRepId: session[:emp_id]).limit(50)
  end

  def create
  	@customer = Customer.new(cust_params)
    @customer.SupportRepId = session[:emp_id]
    if @customer.save
      redirect_to customers_path, notice: 'Customer created!'
    else
      render 'new', :notice=> 'Invalid username or password'
    end
  end


  private
  def cust_params
  	params.require(:customer).permit(:FirstName, :LastName, :Address, :City, :State, :Country, :PostalCode, :Phone, :Email, :SupportRepId)
end

end