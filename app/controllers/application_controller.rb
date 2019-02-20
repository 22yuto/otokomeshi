class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  # protect_from_forgery with: :exception
  # before_action :createlogin

    def set_search
      @search = Recipe.ransack(params[:q])
      @search_recipes = @search.result.page(params[:page])
      @tag_search = Recipe.tagged_with(params[:search])
    end

    # def createlogin
    #   if session[:user_id]
    #     @current_user = User.find_by(id: session[:user_id])
    #   else
    #     @current_user = User.new
    #     @current_user.save
    #     session[:user_id] = @current_user.id
    #   end
    # end




  protected

    def configure_permitted_parameters
      # sign_upのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
      # account_updateのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation])
	  end

      # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
    end

    def after_sign_out_path_for(resource)
      new_user_session_path # ログアウト後に遷移するpathを設定
    end

end