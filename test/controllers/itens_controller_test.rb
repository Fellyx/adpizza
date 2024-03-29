require 'test_helper'

class ItensControllerTest < ActionController::TestCase
  setup do
    @item = itens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { ds_item: @item.ds_item, nm_item: @item.nm_item, qtd_item: @item.qtd_item, vl_item: @item.vl_item }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    patch :update, id: @item, item: { ds_item: @item.ds_item, nm_item: @item.nm_item, qtd_item: @item.qtd_item, vl_item: @item.vl_item }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to itens_path
  end
end
