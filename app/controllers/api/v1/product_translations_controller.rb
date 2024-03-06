class Api::V1::ProductTranslationsController < ApplicationController
  before_action :set_product_translation, only: %i[ show update destroy ]

  # GET /product_translations
  def index
    @product_translations = ProductTranslation.all

    render json: @product_translations
  end

  # GET /product_translations/1
  def show
    render json: @product_translation
  end

  # POST /product_translations
  def create
    @product_translation = ProductTranslation.new(product_translation_params)
    if @product_translation.save
      render json: @product_translation, status: :created, location: api_v1_product_product_translation_url(@product_translation.product, @product_translation)
    else
      render json: @product_translation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_translations/1
  def update
    if @product_translation.update(product_translation_params)
      render json: @product_translation
    else
      render json: @product_translation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /product_translations/1
  def destroy
    @product_translation.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_translation
      @product_translation = ProductTranslation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_translation_params
      params.require(:product_translation).permit(:language, :name, :description, :short_description, :specifications, :characteristics, :color, :product_id)
    end
end
