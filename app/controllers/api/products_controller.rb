module Api
  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
    def index
      @products = Product.all
    end

    def show
    end

    def create
      params.permit!
      @product = Product.new(product_params)
      # @product.name = params[:product][:name]
      # @product. = params[:product][:name]

      if @product.save
        # @product.reload
        render json: @product
        # format.json {render :show, status: :created, location: @product}
      end
    end

    def update
      params.permit!

      if @product.update(product_params)
        render json: @product
      end
    end

    def destroy
      name = @product.name
      if @product.destroy
        render json: {"message": "#{name} was destroyed"}
      end
    end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :description)
    end
  end
end
