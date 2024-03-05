require "test_helper"

class ProductDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_detail = product_details(:one)
  end

  test "should get index" do
    get product_details_url, as: :json
    assert_response :success
  end

  test "should create product_detail" do
    assert_difference("ProductDetail.count") do
      post product_details_url, params: { product_detail: { characteristics: @product_detail.characteristics, color: @product_detail.color, description: @product_detail.description, product_id: @product_detail.product_id, short_description: @product_detail.short_description, specifications: @product_detail.specifications } }, as: :json
    end

    assert_response :created
  end

  test "should show product_detail" do
    get product_detail_url(@product_detail), as: :json
    assert_response :success
  end

  test "should update product_detail" do
    patch product_detail_url(@product_detail), params: { product_detail: { characteristics: @product_detail.characteristics, color: @product_detail.color, description: @product_detail.description, product_id: @product_detail.product_id, short_description: @product_detail.short_description, specifications: @product_detail.specifications } }, as: :json
    assert_response :success
  end

  test "should destroy product_detail" do
    assert_difference("ProductDetail.count", -1) do
      delete product_detail_url(@product_detail), as: :json
    end

    assert_response :no_content
  end
end
