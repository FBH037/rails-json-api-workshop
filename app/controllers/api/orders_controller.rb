module Api
  class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :destroy]
    def index
      render json: Order.all
    end

    def show
      render json: @order
    end

    def create
      params.permit!
      @order = Order.new(order_params)
      if @order.save
        render json: @order
      end
    end

    def update
      params.permit!
      if @order.update(order_params)
        render json: @order
      end
    end

    def destroy
      status = @order.status
      if @order.destroy
        render json: {"message": "order with a status of #{status} was destroyed!"}
      end
    end


  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:total, :sub_total, :tax, :status)
  end

  end
end
