class Customer::CustomersController < ApplicationController

 def show
  @customer = Customer.find(params[:id])
 end

 def edit
  @customer = Customer.find(params[:id])
 end

 def update
  @customer = Customer.find(params[:id])
  @customer.update(customer_params)
  redirect_to customer_customer_path(current_customer.id)
 end

 def unsubscribe
 end


 private

 def customer_params
  params.require(:customer).permit(:nickname, :image, :body)
 end
end
