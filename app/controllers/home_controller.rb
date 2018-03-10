class HomeController < ApplicationController
	#before_action :authenticate_user!, except: [:show], except: [:index]


		  def index
		  	@products = Product.all
		   	#@order = Order.where(is_cart: true).count
		  end

		  def show
		  		

		  end
end
