require "application_system_test_case"

class MenuInventoriesTest < ApplicationSystemTestCase
  setup do
    @menu_inventory = menu_inventories(:one)
  end

  test "visiting the index" do
    visit menu_inventories_url
    assert_selector "h1", text: "Menu inventories"
  end

  test "should create menu inventory" do
    visit menu_inventories_url
    click_on "New menu inventory"

    fill_in "Inventory", with: @menu_inventory.inventory_id
    fill_in "Menu", with: @menu_inventory.menu_id
    fill_in "Quantity required", with: @menu_inventory.quantity_required
    click_on "Create Menu inventory"

    assert_text "Menu inventory was successfully created"
    click_on "Back"
  end

  test "should update Menu inventory" do
    visit menu_inventory_url(@menu_inventory)
    click_on "Edit this menu inventory", match: :first

    fill_in "Inventory", with: @menu_inventory.inventory_id
    fill_in "Menu", with: @menu_inventory.menu_id
    fill_in "Quantity required", with: @menu_inventory.quantity_required
    click_on "Update Menu inventory"

    assert_text "Menu inventory was successfully updated"
    click_on "Back"
  end

  test "should destroy Menu inventory" do
    visit menu_inventory_url(@menu_inventory)
    click_on "Destroy this menu inventory", match: :first

    assert_text "Menu inventory was successfully destroyed"
  end
end
