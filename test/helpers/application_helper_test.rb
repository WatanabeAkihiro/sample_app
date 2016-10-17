require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    # 演習問題のFILL_INがそのままだったので修正 by 佐野
    assert_equal full_title, "Ruby on Rails Tutorial Sample App"
    assert_equal full_title("Help"), "Help | Ruby on Rails Tutorial Sample App"
  end
end