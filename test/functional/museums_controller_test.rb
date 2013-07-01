require 'test_helper'

class MuseumsControllerTest < ActionController::TestCase
  setup do
    @museum = museums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:museums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create museum" do
    assert_difference('Museum.count') do
      post :create, museum: { lat: @museum.lat, long: @museum.long, name: @museum.name }
    end

    assert_redirected_to museum_path(assigns(:museum))
  end

  test "should show museum" do
    get :show, id: @museum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @museum
    assert_response :success
  end

  test "should update museum" do
    put :update, id: @museum, museum: { lat: @museum.lat, long: @museum.long, name: @museum.name }
    assert_redirected_to museum_path(assigns(:museum))
  end

  test "should destroy museum" do
    assert_difference('Museum.count', -1) do
      delete :destroy, id: @museum
    end

    assert_redirected_to museums_path
  end
end
