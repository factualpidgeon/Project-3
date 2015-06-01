require 'test_helper'

class DayControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get json_show" do
    get :json_show
    assert_response :success
  end

end
