require "test_helper"

class SecurityButtonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @security_button = security_buttons(:one)
  end

  test "should get index" do
    get security_buttons_url, as: :json
    assert_response :success
  end

  test "should create security_button" do
    assert_difference("SecurityButton.count") do
      post security_buttons_url, params: { security_button: { latitude: @security_button.latitude, longitude: @security_button.longitude } }, as: :json
    end

    assert_response :created
  end

  test "should show security_button" do
    get security_button_url(@security_button), as: :json
    assert_response :success
  end

  test "should update security_button" do
    patch security_button_url(@security_button), params: { security_button: { latitude: @security_button.latitude, longitude: @security_button.longitude } }, as: :json
    assert_response :success
  end

  test "should destroy security_button" do
    assert_difference("SecurityButton.count", -1) do
      delete security_button_url(@security_button), as: :json
    end

    assert_response :no_content
  end
end
