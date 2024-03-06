class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy ]
  before_action :set_user, only: %i[ show update destroy ]

  # GET /orders
  # def index
  #   @orders = Order.all

  #   render json: @orders
  # end

  # GET /orders/1
  def show
    render json: @order
  end

  #GET /users/current_order
  def current_order
    @order = @user.current_order
    render json: @order, include(order_products: {include: :product})
  end

  def past_orders
    @orders = @user.past_orders
    render json: @orders, include(order_products: {include: :product})
  end

  # # POST /orders
  # def create
  #   @order = Order.new(order_params)

  #   if @order.save
  #     render json: @order, status: :created, location: @order
  #   else
  #     render json: @order.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:completed, :total_price, :user_id)
    end
end
