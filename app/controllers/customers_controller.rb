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

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	@customer.SupportRepId = session[:emp_id]
  	if @customer.update(cust_params)
  	  redirect_to customers_path, notice: 'Customer updated!'
  	else 
  	  render :edit
  	end
  end

  def destroy
  	@customer = Customer.find(params[:id])
  	@customer.destroy

  	redirect_to customers_path, notice: 'Customer deleted!'
  end

  private
  def cust_params
  	params.require(:customer).permit(:FirstName, :LastName, :Address, :City, :State, :Country, :PostalCode, :Phone, :Email, :SupportRepId)
end

end