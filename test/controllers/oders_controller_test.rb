require 'test_helper'

class OdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get oders_new_url
    assert_response :success
  end

  test "should get create" do
    get oders_create_url
    assert_response :success
  end

  test "should get edit" do
    get oders_edit_url
    assert_response :success
  end

end
