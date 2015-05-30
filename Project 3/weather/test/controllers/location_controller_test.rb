require 'test_helper'

class LocationControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get id_date" do
    get :id_date
    assert_response :success
  end

  test "should get pcode_date" do
    get :pcode_date
    assert_response :success
  end

  test "should get pcode_predict" do
    get :pcode_predict
    assert_response :success
  end

  test "should get lat_lon_predict" do
    get :lat_lon_predict
    assert_response :success
  end

end
