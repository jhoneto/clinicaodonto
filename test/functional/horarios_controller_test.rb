require 'test_helper'

class HorariosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:horarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create horario" do
    assert_difference('Horario.count') do
      post :create, :horario => { }
    end

    assert_redirected_to horario_path(assigns(:horario))
  end

  test "should show horario" do
    get :show, :id => horarios(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => horarios(:one).to_param
    assert_response :success
  end

  test "should update horario" do
    put :update, :id => horarios(:one).to_param, :horario => { }
    assert_redirected_to horario_path(assigns(:horario))
  end

  test "should destroy horario" do
    assert_difference('Horario.count', -1) do
      delete :destroy, :id => horarios(:one).to_param
    end

    assert_redirected_to horarios_path
  end
end
