class Api::LineItemsController < ApplicationController
  before_action :set_order
  before_action :set_product
  before_action :set_line_item, only: [:show, :update, :destroy]

  def index
    @line_items = LineItem.all
    render json: @line_items, except: :markup
  end

  def show
    render json: @line_item, except: :markup
  end

  def create
    @line_item = LineItem.new(line_item_params)
    @line_item.product_id = @product.id
    @line_item.order_id = @order.id
    if @line_item.save
      render json: @line_item, except: :markup, except: :markup
    end
  end

  def update
    if @line_item.update(line_item_params)
      render json: @line_item, except: :markup
    end
  end

  def destroy
    render json: {"notice": "This may or may not have worked"}
  end

private

  def line_item_params
    params.require(:line_item).permit(:product_id, :order_id, :quantity, :markup)
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def set_order
    @order = Order.find(params[:order_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
