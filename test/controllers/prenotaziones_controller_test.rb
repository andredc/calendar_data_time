require 'test_helper'

class PrenotazionesControllerTest < ActionController::TestCase
  setup do
    @prenotazione = prenotaziones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prenotaziones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prenotazione" do
    assert_difference('Prenotazione.count') do
      post :create, prenotazione: { Pdata: @prenotazione.Pdata, Pgiorno: @prenotazione.Pgiorno, Pora: @prenotazione.Pora, nome: @prenotazione.nome }
    end

    assert_redirected_to prenotazione_path(assigns(:prenotazione))
  end

  test "should show prenotazione" do
    get :show, id: @prenotazione
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prenotazione
    assert_response :success
  end

  test "should update prenotazione" do
    patch :update, id: @prenotazione, prenotazione: { Pdata: @prenotazione.Pdata, Pgiorno: @prenotazione.Pgiorno, Pora: @prenotazione.Pora, nome: @prenotazione.nome }
    assert_redirected_to prenotazione_path(assigns(:prenotazione))
  end

  test "should destroy prenotazione" do
    assert_difference('Prenotazione.count', -1) do
      delete :destroy, id: @prenotazione
    end

    assert_redirected_to prenotaziones_path
  end
end
