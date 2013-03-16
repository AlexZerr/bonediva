require "minitest_helper"

class AboutControllerTest < MiniTest::Rails::ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
