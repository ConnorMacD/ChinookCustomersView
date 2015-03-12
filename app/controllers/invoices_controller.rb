class InvoicesController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @invoices = @customer.invoices
  end
end