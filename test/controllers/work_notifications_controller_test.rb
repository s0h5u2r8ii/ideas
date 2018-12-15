require 'test_helper'

class WorkNotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get link_through" do
    get work_notifications_link_through_url
    assert_response :success
  end

end
