require 'test_helper'

class WidgetsControllerTest < Capybara::Rails::TestCase
  def test_index_without_stubbed_current_user
    visit '/'
    assert page.has_content?('original_current_user')
  end

  def test_index_with_stubbed_current_user
    ApplicationController.any_instance.stubs(:current_user).returns('stubbed_current_user')
    visit '/'
    assert page.has_content?('stubbed_current_user')
  end
end
