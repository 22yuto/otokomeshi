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
  	   redirect_to new_recipe_order_path(@recipe.id)
  	else
  	   render 'new'
  	end
  end

  def index
  	# @recipes = Recipe.where(user_id: current_user.id).page(params[:page]).reverse_order
    @recipes = Recipe.page(params[:page]).per(4).reverse_order
    @favo = Favorite.where(user_id: current_user.id)
    @rice_tag_recipes = Recipe.tagged_with(["ご飯もの"]).page(params[:page]).per(1).reverse_order
    @vegetable_tag_recipes = Recipe.tagged_with(["野菜"]).page(params[:page]).per(1).reverse_order
    @soup_tag_recipes = Recipe.tagged_with(["スープ"]).page(params[:page]).per(1).reverse_order
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
    @recipe = Recipe.find(params[:id])
    if @recipe.user_id != current_user.id
      flash[:notice] = "can't successfully access!!"
      redirect_to root_path
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe.id)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to user_path(current_user.id)
  end



  private

  def recipe_params
      params.require(:recipe).permit(:title, :image, :body, :time, :cost, :material, :quantity, 
        :category_list, orders_attributes: [:id, :order_num, :order_image, :order_body, :image])
  end


end
