require "test_helper"

class ComplaintsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @complaint = complaints(:one)
  end

  test "should get index" do
    get complaints_url, as: :json
    assert_response :success
  end

  test "should create complaint" do
    assert_difference("Complaint.count") do
      post complaints_url, params: { complaint: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show complaint" do
    get complaint_url(@complaint), as: :json
    assert_response :success
  end

  test "should update complaint" do
    patch complaint_url(@complaint), params: { complaint: {  } }, as: :json
    assert_response :success
  end

  test "should destroy complaint" do
    assert_difference("Complaint.count", -1) do
      delete complaint_url(@complaint), as: :json
    end

    assert_response :no_content
  end
end
