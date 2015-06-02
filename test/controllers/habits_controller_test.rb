require 'test_helper'

class HabitsControllerTest < ActionController::TestCase
  setup do
    @habit = habits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:habits)
  end

  test "should create habit" do
    assert_difference('Habit.count') do
      post :create, habit: { name: @habit.name, streak: @habit.streak }
    end

    assert_response 201
  end

  test "should show habit" do
    get :show, id: @habit
    assert_response :success
  end

  test "should update habit" do
    put :update, id: @habit, habit: { name: @habit.name, streak: @habit.streak }
    assert_response 204
  end

  test "should destroy habit" do
    assert_difference('Habit.count', -1) do
      delete :destroy, id: @habit
    end

    assert_response 204
  end
end
