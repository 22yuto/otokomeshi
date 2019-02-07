class RecipesController < ApplicationController


  def new
  	@recipe = Recipe.new
  	@recipe.orders.build
  end

  def create
  	@recipe = Recipe.new(recipe_params)
  	@recipe.user_id = current_user.id
  	if @recipe.save
  	   redirect_to new_recipe_order_path(@recipe.id)
  	else
  	   render 'new'
  	end
  end

  def index
  	@recipes = Recipe.page(params[:page]).reverse_order
  end

  def show
  	@recipe = Recipe.find(params[:id])
  end

  def edit
  end


  private

  def recipe_params
      params.require(:recipe).permit(:title, :image, :body, :time, :cost, :material, :quantity,
      	 orders_attributes: [:id, :order_num, :order_image, :order_body])
  end


end
