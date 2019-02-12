class LikesController < ApplicationController

	before_action :set_recipe

	def create
		@like = Like.create(user_id: current_user.id, recipe_id: params[:recipe_id])
		@likes = Like.where(recipe_id: params[:recipe_id])
		@recipe.reload
	end

	def destroy
		like = Like.find_by(user_id: current_user.id, recipe_id: params[:recipe_id])
		like.destroy
		@likes = Like.where(recipe_id: params[:recipe_id])
		@recipe.reload
	end

	private

	def set_recipe
	    @recipe = Recipe.find(params[:recipe_id])
	end
end
