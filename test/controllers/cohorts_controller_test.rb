require 'test_helper'

class CohortsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cohorts_new_url
    assert_response :success
  end

  test "should get edit" do
    get cohorts_edit_url
    assert_response :success
  end

  test "should get shot" do
    get cohorts_shot_url
    assert_response :success
  end

  test "should get index" do
    get cohorts_index_url
    assert_response :success
  end

end
