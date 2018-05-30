class ProductsController < ApplicationController
  def show
    @product = Product.find_by_id(params[:id])
    #@order = Order.find_by_user_id(current_user.id)
    #@comments = Comment.where(:product_id => @product.id)
    #pp @comments


  end

  def edit
      @product = Product.find_by_id(params[:id])
      
  end

  def update
       @product = Product.find_by_id(params[:id])
       if @product.update(product_params)
         flash[:success] = "Saved!"
        redirect_to product_path
      else
        render 'edit'
      end
     
  end


private

  def product_params
    params.require(:product).permit(:prname, :maker, :description, :year, :cost)
  end

end
