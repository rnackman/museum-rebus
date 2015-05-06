require 'test_helper'

class RebusesControllerTest < ActionController::TestCase
  setup do
    @rebus = rebuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rebuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rebus" do
    assert_difference('Rebus.count') do
      post :create, rebus: {  }
    end

    assert_redirected_to rebus_path(assigns(:rebus))
  end

  test "should show rebus" do
    get :show, id: @rebus
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rebus
    assert_response :success
  end

  test "should update rebus" do
    patch :update, id: @rebus, rebus: {  }
    assert_redirected_to rebus_path(assigns(:rebus))
  end

  test "should destroy rebus" do
    assert_difference('Rebus.count', -1) do
      delete :destroy, id: @rebus
    end

    assert_redirected_to rebuses_path
  end
end
