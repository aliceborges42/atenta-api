require "test_helper"

class DeslikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deslike = deslikes(:one)
  end

  test "should get index" do
    get deslikes_url, as: :json
    assert_response :success
  end

  test "should create deslike" do
    assert_difference("Deslike.count") do
      post deslikes_url, params: { deslike: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show deslike" do
    get deslike_url(@deslike), as: :json
    assert_response :success
  end

  test "should update deslike" do
    patch deslike_url(@deslike), params: { deslike: {  } }, as: :json
    assert_response :success
  end

  test "should destroy deslike" do
    assert_difference("Deslike.count", -1) do
      delete deslike_url(@deslike), as: :json
    end

    assert_response :no_content
  end
end
