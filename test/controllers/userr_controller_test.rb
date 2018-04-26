require 'test_helper'

class UserrControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get userr_index_url
    assert_response :success
  end

end
