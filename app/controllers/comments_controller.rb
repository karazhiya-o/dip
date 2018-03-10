class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
  	@product = Product.find_by_id(params[:id])
  	pp @product
  	@comments = Comment.where(:product_id => @product.id)
  	pp @comments
  end


  def create
  	@product = Product.find(params[:product_id])
  	@comments = @product.comments.create(comment_params)
    redirect_back(fallback_location: :back)
  end


def destroy
  	@comment = Comment.find_by_id(params[:id])
    pp @comment

  	@comment.destroy
  	redirect_back(fallback_location: :back)
  end

  private
  def comment_params
  	params.require(:comment).permit(:product_id, :user_id, :body)
  end


end
