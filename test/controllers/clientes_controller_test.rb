require 'test_helper'

class ClientesControllerTest < ActionController::TestCase
  setup do
    @cliente = clientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cliente" do
    assert_difference('Cliente.count') do
      post :create, cliente: { nm_bairro: @cliente.nm_bairro, nm_cidade: @cliente.nm_cidade, nm_cliente: @cliente.nm_cliente, nm_complemento: @cliente.nm_complemento, nm_endereco_cliente: @cliente.nm_endereco_cliente, nm_uf: @cliente.nm_uf, num_endereco: @cliente.num_endereco, num_tel_cliente: @cliente.num_tel_cliente, cep: @cliente.cep }
    end

    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should show cliente" do
    get :show, id: @cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cliente
    assert_response :success
  end

  test "should update cliente" do
    patch :update, id: @cliente, cliente: { nm_bairro: @cliente.nm_bairro, nm_cidade: @cliente.nm_cidade, nm_cliente: @cliente.nm_cliente, nm_complemento: @cliente.nm_complemento, nm_endereco_cliente: @cliente.nm_endereco_cliente, nm_uf: @cliente.nm_uf, num_endereco: @cliente.num_endereco, num_tel_cliente: @cliente.num_tel_cliente, cep: @cliente.cep }
    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should destroy cliente" do
    assert_difference('Cliente.count', -1) do
      delete :destroy, id: @cliente
    end

    assert_redirected_to clientes_path
  end
end
