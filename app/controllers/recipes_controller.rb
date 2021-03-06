class RecipesController < ApplicationController

impressionist :actions=> [:show]


  def about
  end
  
  def new
  	@recipe = Recipe.new
  	@recipe.orders.build
  end

  def confirm
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.user_id = current_user.id
    render :new if @recipe.invalid?
  end

  def confirm_update
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.update(open_flg: true)
    redirect_to recipe_path(@recipe)
  end

  def create
  	@recipe = Recipe.new(recipe_params)
  	@recipe.user_id = current_user.id
  	if params[:back]
      render 'new'
    elsif @recipe.save
  	   redirect_to new_recipe_order_path(@recipe)
  	else
  	   render 'new'
  	end
  end

  def index
  	# @recipes = Recipe.where(user_id: current_user.id).page(params[:page]).reverse_order
    @recipes = Recipe.where(open_flg: true).page(params[:page]).per(4).reverse_order
    # @favo = Favorite.where(user_id: current_user.id)
    # @recipe = Recipe.where('created_at > ?', 1.day.ago).last
    @ranking = Recipe.order('impressions_count DESC').take(4)
    @random = Recipe.where('id >= ?', rand(Recipe.first.id..Recipe.last.id)).first
    # if Recipe.where(id: @random) == 1
    #   puts "あたり"
    # end
    @rice_tag_recipes = Recipe.tagged_with(["ご飯もの"]).page(params[:page]).per(2).reverse_order
    @vegetable_tag_recipes = Recipe.tagged_with(["野菜"]).page(params[:page]).per(2).reverse_order
    @soup_tag_recipes = Recipe.tagged_with(["スープ"]).page(params[:page]).per(2).reverse_order
  end

  def tag_index
    @tags = Recipe.tagged_with(params[:tag_name])
  end

  def search
    @recipes = Recipe.page(params[:page]).reverse_order
  end

  def show
  	@recipe = Recipe.find(params[:id])
    if user_signed_in?
      @favo = current_user.favorites.where(recipe_id: @recipe.id)
      @favorite = @recipe.favorites.limit(4)
    end
    impressionist(@recipe, nil, unique: [:session_hash])
    @comment = Comment.new
    @comments = @recipe.comments
    @comments_count = @comments.count
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
