require "test_helper"

class ProductTranslationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_translation = product_translations(:one)
  end

  test "should get index" do
    get product_translations_url, as: :json
    assert_response :success
  end

  test "should create product_translation" do
    assert_difference("ProductTranslation.count") do
      post product_translations_url, params: { product_translation: { characteristics: @product_translation.characteristics, color: @product_translation.color, description: @product_translation.description, language_code_id: @product_translation.language_code_id, product_id: @product_translation.product_id, short_description: @product_translation.short_description, specifications: @product_translation.specifications } }, as: :json
    end

    assert_response :created
  end

  test "should show product_translation" do
    get product_translation_url(@product_translation), as: :json
    assert_response :success
  end

  test "should update product_translation" do
    patch product_translation_url(@product_translation), params: { product_translation: { characteristics: @product_translation.characteristics, color: @product_translation.color, description: @product_translation.description, language_code_id: @product_translation.language_code_id, product_id: @product_translation.product_id, short_description: @product_translation.short_description, specifications: @product_translation.specifications } }, as: :json
    assert_response :success
  end

  test "should destroy product_translation" do
    assert_difference("ProductTranslation.count", -1) do
      delete product_translation_url(@product_translation), as: :json
    end

    assert_response :no_content
  end
end
