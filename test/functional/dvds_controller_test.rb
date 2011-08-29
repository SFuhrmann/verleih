require 'test_helper'

class DvdsControllerTest < ActionController::TestCase
  setup do
    @dvd = dvds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dvds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dvd" do
    assert_difference('Dvd.count') do
      post :create, :dvd => @dvd.attributes
    end

    assert_redirected_to dvd_path(assigns(:dvd))
  end

  test "should show dvd" do
    get :show, :id => @dvd.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @dvd.to_param
    assert_response :success
  end

  test "should update dvd" do
    put :update, :id => @dvd.to_param, :dvd => @dvd.attributes
    assert_redirected_to dvd_path(assigns(:dvd))
  end

  test "should destroy dvd" do
    assert_difference('Dvd.count', -1) do
      delete :destroy, :id => @dvd.to_param
    end

    assert_redirected_to dvds_path
  end
end
