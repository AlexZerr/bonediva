require 'test_helper'
require 'minitest/spec'

class UserTest < ActiveSupport::TestCase
  describe User do
    @user = User.new
    assert_not_nil @user.name
    assert_not_nil @user.email
  end
  # test "the truth" do
  #   assert true
  # end
end
