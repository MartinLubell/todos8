require 'test_helper'

class TodoitemsControllerTest < ActionController::TestCase
  test "should get due_date" do
    get :due_date
    assert_response :success
  end

  test "should get task_title" do
    get :task_title
    assert_response :success
  end

  test "should get description" do
    get :description
    assert_response :success
  end

end
