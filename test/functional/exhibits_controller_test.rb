require 'test_helper'

class ExhibitsControllerTest < ActionController::TestCase
  setup do
    @exhibit = exhibits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exhibits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exhibit" do
    assert_difference('Exhibit.count') do
      post :create, exhibit: { audio: @exhibit.audio, description: @exhibit.description, floor: @exhibit.floor, lat: @exhibit.lat, long: @exhibit.long, museum_id: @exhibit.museum_id, qr_code: @exhibit.qr_code, title: @exhibit.title, video: @exhibit.video }
    end

    assert_redirected_to exhibit_path(assigns(:exhibit))
  end

  test "should show exhibit" do
    get :show, id: @exhibit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exhibit
    assert_response :success
  end

  test "should update exhibit" do
    put :update, id: @exhibit, exhibit: { audio: @exhibit.audio, description: @exhibit.description, floor: @exhibit.floor, lat: @exhibit.lat, long: @exhibit.long, museum_id: @exhibit.museum_id, qr_code: @exhibit.qr_code, title: @exhibit.title, video: @exhibit.video }
    assert_redirected_to exhibit_path(assigns(:exhibit))
  end

  test "should destroy exhibit" do
    assert_difference('Exhibit.count', -1) do
      delete :destroy, id: @exhibit
    end

    assert_redirected_to exhibits_path
  end
end
