class Admin::CustomersController < ApplicationController
  
  def withdrawal
   @customer = Customer.find(params[:customer_id])
   @customer.update(is_deleted: true)
   redirect_to customer_customers_path
  end
end
