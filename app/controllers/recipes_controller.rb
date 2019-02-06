class RecipesController < ApplicationController


  def new
  	@recipe = Recipe.new
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
  end

  def edit
  end


  private

  def recipe_params
      params.require(:recipe).permit(:title, :image, :body, :time, :cost, :material, :quantity)
  end



end
