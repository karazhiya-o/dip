class HomeController < ApplicationController
	#before_action :authenticate_user!, except: [:show], except: [:index]



		  def index
		  	@products = Product.all
		   	#@order = Order.where(is_cart: true).count
		   	@products = if params[:term]
    			Product.where('maker LIKE ?', "%#{params[:term]}%")
  			else
    			
  			end
		  end

		def show
		  	#@products = Product.all	
		  	@products = Product.search(params[:term])
		  		  	
		end

		def google_map(center)
  			"https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
		end

		def task_params
  			params.require(:products).permit(:prname, :maker, :description, :year, :cost)
		end

end
