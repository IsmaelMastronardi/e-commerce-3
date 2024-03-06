class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]

  # GET /products
  def index
    @products = Product.all

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product.as_json(
      include: {
        product_detail: {},
        product_translations: {},
        category: {},
        brand: {},
      }
    )
  end

  # POST /products
  def create
    @product = Product.new(product_params[:atributes])
    @product.product_detail = ProductDetail.new(product_params[:product_details])
    if @product.save
      render json: @product, include: [:product_detail], status: :created, location: api_v1_product_url(@product)
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(atributes: [:name, :price, :available_amount, :image, :category_id, :brand_id], product_details: [:description, :short_description, :specifications, :characteristics, :color])
    end
end
