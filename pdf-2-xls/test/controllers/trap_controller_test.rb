require 'test_helper'

class TrapControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get show_request" do
    get :show_request
    assert_response :success
  end

  test "should get show_request_details" do
    get :show_request_details
    assert_response :success
  end

end
