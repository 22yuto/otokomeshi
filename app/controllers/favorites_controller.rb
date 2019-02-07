class FavoritesController < ApplicationController


	def index
		# favo = Favorite.where(user_id: current_user.id)
		@favo = current_user.favorites
		# @recipe = Recipe.find(params[:recipe_id])
	end

	def create
		user = current_user
		@recipe = Recipe.find(params[:recipe_id])
		if Favorite.create(user_id: user.id, recipe_id: @recipe.id)
			redirect_to myfavorites_path
		end
	end


	def destroy
	    user = current_user
	    @recipe = Recipe.find(params[:recipe_id])
	    if favorite = Favorite.find_by(user_id: user.id, recipe_id: @recipe.id)
	      favorite.destroy
	      redirect_to myfavorites_path
	  	end
	end


	private

  	def recipe_params
      params.require(:recipe).permit(:title, :image, :body, :time, :cost, :material, :quantity,
      	 orders_attributes: [:id, :order_num, :order_image, :order_body, :image])
  	end

end
