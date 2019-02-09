class RecipesController < ApplicationController


  def new
  	@recipe = Recipe.new
  	@recipe.orders.build
  end

  def create
  	@recipe = Recipe.new(recipe_params)
  	@recipe.user_id = current_user.id
  	if @recipe.save
  	   redirect_to root_path
  	else
  	   render 'new'
  	end
  end

  def index
  	# @recipes = Recipe.where(user_id: current_user.id).page(params[:page]).reverse_order
    @recipes = Recipe.page(params[:page]).reverse_order
  end

  def search
    @recipes = Recipe.page(params[:page]).reverse_order
  end

  def show
  	@recipe = Recipe.find(params[:id])
    @comment = Comment.new
    @comments = @recipe.comments
  end

  def edit
  end



  private

  def recipe_params
      params.require(:recipe).permit(:title, :image, :body, :time, :cost, :material, :quantity,
      	 orders_attributes: [:id, :order_num, :order_image, :order_body, :image])
  end


end
