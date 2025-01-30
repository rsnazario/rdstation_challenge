class CartsController < ApplicationController
  before_action :set_cart

  def show
    render json: @cart
  end

  def create
    debugger
    render json: @cart
  end

  private

  def set_cart
    @cart = session[:cart_id].present? ? Cart.find(session[:cart_id]) : Cart.create!(total_price: 0)

    session[:cart_id] = @cart.id
  end

  def cart_products_params
    params.permit(:product_id, :quantity)
  end
end
