class RecipesController < ApplicationController

impressionist :actions=> [:show]

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
    @recipes = Recipe.page(params[:page]).per(4).reverse_order
    @favo = Favorite.where(user_id: current_user.id)
    @rice_tag_recipes = Recipe.tagged_with(["ご飯もの"])
    @vegetable_tag_recipes = Recipe.tagged_with(["野菜"])
    @soup_tag_recipes = Recipe.tagged_with(["スープ"])
  end

  def search
    @recipes = Recipe.page(params[:page]).reverse_order
  end

  def show
  	@recipe = Recipe.find(params[:id])
    impressionist(@recipe, nil, unique: [:session_hash])
    @comment = Comment.new
    @comments = @recipe.comments
  end

  def edit
  end



  private

  def recipe_params
      params.require(:recipe).permit(:title, :image, :body, :time, :cost, :material, :quantity, 
        :category_list, orders_attributes: [:id, :order_num, :order_image, :order_body, :image])
  end


end
