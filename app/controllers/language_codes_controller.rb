class LanguageCodesController < ApplicationController
  before_action :set_language_code, only: %i[ show update destroy ]

  # GET /language_codes
  def index
    @language_codes = LanguageCode.all

    render json: @language_codes
  end

  # GET /language_codes/1
  def show
    render json: @language_code
  end

  # POST /language_codes
  def create
    @language_code = LanguageCode.new(language_code_params)

    if @language_code.save
      render json: @language_code, status: :created, location: @language_code
    else
      render json: @language_code.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /language_codes/1
  def update
    if @language_code.update(language_code_params)
      render json: @language_code
    else
      render json: @language_code.errors, status: :unprocessable_entity
    end
  end

  # DELETE /language_codes/1
  def destroy
    @language_code.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language_code
      @language_code = LanguageCode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def language_code_params
      params.require(:language_code).permit(:language, :iso)
    end
end
