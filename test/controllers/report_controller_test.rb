require 'test_helper'

class ReportControllerTest < ActionController::TestCase
  test "should get month" do
    get :month
    assert_response :success
  end

  test "should get year" do
    get :year
    assert_response :success
  end

end
