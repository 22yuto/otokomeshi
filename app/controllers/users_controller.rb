class UsersController < ApplicationController

	before_action :authenticate_user!

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@recipes = @user.recipes.page(params[:page]).reverse_order
	end

	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
			flash[:notice] = "can't successfully access!!"
			redirect_to root_path
		end
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end


	def follows
	    user = User.find(params[:id])
	    @users = user.followings
  	end

  	def followers
	    user = User.find(params[:id])
	    @users = user.followers
  	end


private
  	def user_params
	    params.require(:user).permit(:name, :email, :profile_image, :introduction)
	end
end
