class OrdersController < ApplicationController
  

  def new
  	@recipe = Recipe.find(params[:recipe_id])
  	@new_order = Order.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @new_order = Order.new(order_params)
    @new_order.recipe_id = @recipe.id
    respond_to do |format|
      if @new_order.save!
        @new_order.errors.full_messages
        format.html
        format.js
    @new_orders = Order.where(recipe_id: @recipe)
      else
        format.js {render :new}
      end
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @new_order = Order.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @new_order = Order.find_by(id: params[:id], recipe_id: @recipe.id)
    @new_order.destroy
    redirect_to recipe_path(@recipe)
  end


  private

  def order_params
      params.require(:order).permit(:order_image, :order_num, :order_body)
  end

end
