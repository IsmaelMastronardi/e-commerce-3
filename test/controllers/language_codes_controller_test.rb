require "test_helper"

class LanguageCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @language_code = language_codes(:one)
  end

  test "should get index" do
    get language_codes_url, as: :json
    assert_response :success
  end

  test "should create language_code" do
    assert_difference("LanguageCode.count") do
      post language_codes_url, params: { language_code: { iso: @language_code.iso, language: @language_code.language } }, as: :json
    end

    assert_response :created
  end

  test "should show language_code" do
    get language_code_url(@language_code), as: :json
    assert_response :success
  end

  test "should update language_code" do
    patch language_code_url(@language_code), params: { language_code: { iso: @language_code.iso, language: @language_code.language } }, as: :json
    assert_response :success
  end

  test "should destroy language_code" do
    assert_difference("LanguageCode.count", -1) do
      delete language_code_url(@language_code), as: :json
    end

    assert_response :no_content
  end
end
