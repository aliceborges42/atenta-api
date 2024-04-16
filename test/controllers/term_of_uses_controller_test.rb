require "test_helper"

class TermOfUsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @term_of_use = term_of_uses(:one)
  end

  test "should get index" do
    get term_of_uses_url, as: :json
    assert_response :success
  end

  test "should create term_of_use" do
    assert_difference("TermOfUse.count") do
      post term_of_uses_url, params: { term_of_use: { content: @term_of_use.content } }, as: :json
    end

    assert_response :created
  end

  test "should show term_of_use" do
    get term_of_use_url(@term_of_use), as: :json
    assert_response :success
  end

  test "should update term_of_use" do
    patch term_of_use_url(@term_of_use), params: { term_of_use: { content: @term_of_use.content } }, as: :json
    assert_response :success
  end

  test "should destroy term_of_use" do
    assert_difference("TermOfUse.count", -1) do
      delete term_of_use_url(@term_of_use), as: :json
    end

    assert_response :no_content
  end
end
