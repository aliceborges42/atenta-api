require "test_helper"

class TypeSpecificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_specification = type_specifications(:one)
  end

  test "should get index" do
    get type_specifications_url, as: :json
    assert_response :success
  end

  test "should create type_specification" do
    assert_difference("TypeSpecification.count") do
      post type_specifications_url, params: { type_specification: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show type_specification" do
    get type_specification_url(@type_specification), as: :json
    assert_response :success
  end

  test "should update type_specification" do
    patch type_specification_url(@type_specification), params: { type_specification: {  } }, as: :json
    assert_response :success
  end

  test "should destroy type_specification" do
    assert_difference("TypeSpecification.count", -1) do
      delete type_specification_url(@type_specification), as: :json
    end

    assert_response :no_content
  end
end
