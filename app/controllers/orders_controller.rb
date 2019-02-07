class OrdersController < ApplicationController
  


  def new
  	@recipe = Recipe.find(params[:recipe_id])
  	@order = @recipe.orders.build
  end

  def create
  end

  def edit
  end


  private

  def order_params
      params.require(:order).permit(:order_image, :order_num, :order_body)
  end

end
