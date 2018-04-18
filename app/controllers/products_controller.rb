class ProductsController < ApplicationController
  def show
  	@product = Product.find_by_id(params[:id])
  	#@order = Order.find_by_user_id(current_user.id)
  	
  end
end
