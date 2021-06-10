class Customer::CustomersController < ApplicationController

 def index
  @customer = Customer.all
 end

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



 def withdrawal

  @customer = Customer.find(params[:customer_id])
  @customer.update(is_deleted: true)
  #is_deletedカラムにフラグを立てる（defaultはfalse)
  reset_session
  flash[:notice] = "ありがとうございました！またのご利用をお待ちしています！"
  redirect_to root_path
 end


 private

 def customer_params
  params.require(:customer).permit(:nickname, :image, :body)
 end
end
