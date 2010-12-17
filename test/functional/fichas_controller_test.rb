require 'test_helper'

class FichasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fichas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ficha" do
    assert_difference('Ficha.count') do
      post :create, :ficha => { }
    end

    assert_redirected_to ficha_path(assigns(:ficha))
  end

  test "should show ficha" do
    get :show, :id => fichas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fichas(:one).to_param
    assert_response :success
  end

  test "should update ficha" do
    put :update, :id => fichas(:one).to_param, :ficha => { }
    assert_redirected_to ficha_path(assigns(:ficha))
  end

  test "should destroy ficha" do
    assert_difference('Ficha.count', -1) do
      delete :destroy, :id => fichas(:one).to_param
    end

    assert_redirected_to fichas_path
  end
end
