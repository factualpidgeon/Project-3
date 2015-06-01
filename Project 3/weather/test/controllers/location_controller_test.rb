require 'test_helper'

class LocationControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get predict" do
    get :predict
    assert_response :success
  end

  test "should get json_index" do
    get :json_index
    assert_response :success
  end

  test "should get json_predict" do
    get :json_predict
    assert_response :success
  end

end
