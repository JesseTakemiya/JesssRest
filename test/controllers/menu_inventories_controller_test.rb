require "test_helper"

class MenuInventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu_inventory = menu_inventories(:one)
  end

  test "should get index" do
    get menu_inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_menu_inventory_url
    assert_response :success
  end

  test "should create menu_inventory" do
    assert_difference("MenuInventory.count") do
      post menu_inventories_url, params: { menu_inventory: { inventory_id: @menu_inventory.inventory_id, menu_id: @menu_inventory.menu_id, quantity_required: @menu_inventory.quantity_required } }
    end

    assert_redirected_to menu_inventory_url(MenuInventory.last)
  end

  test "should show menu_inventory" do
    get menu_inventory_url(@menu_inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_menu_inventory_url(@menu_inventory)
    assert_response :success
  end

  test "should update menu_inventory" do
    patch menu_inventory_url(@menu_inventory), params: { menu_inventory: { inventory_id: @menu_inventory.inventory_id, menu_id: @menu_inventory.menu_id, quantity_required: @menu_inventory.quantity_required } }
    assert_redirected_to menu_inventory_url(@menu_inventory)
  end

  test "should destroy menu_inventory" do
    assert_difference("MenuInventory.count", -1) do
      delete menu_inventory_url(@menu_inventory)
    end

    assert_redirected_to menu_inventories_url
  end
end
