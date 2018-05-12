class OrdersController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def new
  	@product = Product.find_by_id(params[:id])
  	@order = Order.new(:product_id => @product.id, :user_id => current_user.id, :cost =>@product.cost, :is_cart => true)
  	@order.save
  	redirect_to root_path


  end

  def index
  	@orders = Order.where(user_id: current_user.id).where(is_cart: true)
    
  end

  def pay
    @order = Order.find_by_id(params[:id])
    @order.update(:is_cart => false)
    redirect_back(fallback_location: :back)
  end

  def delete
     @order = Order.find_by_id(params[:id])
     @order.destroy
     redirect_back(fallback_location: :back)
  end
end
