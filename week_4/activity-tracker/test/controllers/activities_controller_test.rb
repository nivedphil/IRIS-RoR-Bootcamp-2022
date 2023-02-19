require "test_helper"

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity = activities(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get activities_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_activity_url
    assert_response :success
  end

  test "should create activity" do
    assert_difference("Activity.count") do
      post activities_url, params: { activity: { activity_type: @activity.activity_type, calories: @activity.calories, duration: @activity.duration, start: @activity.start, title: @activity.title } }
    end

    assert_redirected_to activity_url(Activity.last)
  end

  test "should show activity" do
    sign_in users(:one)
    get activity_url(@activity)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_activity_url(@activity)
    assert_response :success
  end

  test "should update activity" do
    sign_in users(:one)
    patch activity_url(@activity), params: { activity: { activity_type: @activity.activity_type, calories: @activity.calories, duration: @activity.duration, start: @activity.start, title: @activity.title } }
    assert_redirected_to activity_url(@activity)
  end

  test "should destroy activity" do
    assert_difference("Activity.count", -1) do
      delete activity_url(@activity)
    end

    assert_redirected_to activities_url
  end
end
