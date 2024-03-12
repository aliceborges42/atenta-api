require "test_helper"

class ComplaintTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @complaint_type = complaint_types(:one)
  end

  test "should get index" do
    get complaint_types_url, as: :json
    assert_response :success
  end

  test "should create complaint_type" do
    assert_difference("ComplaintType.count") do
      post complaint_types_url, params: { complaint_type: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show complaint_type" do
    get complaint_type_url(@complaint_type), as: :json
    assert_response :success
  end

  test "should update complaint_type" do
    patch complaint_type_url(@complaint_type), params: { complaint_type: {  } }, as: :json
    assert_response :success
  end

  test "should destroy complaint_type" do
    assert_difference("ComplaintType.count", -1) do
      delete complaint_type_url(@complaint_type), as: :json
    end

    assert_response :no_content
  end
end
