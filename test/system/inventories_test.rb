require "application_system_test_case"

class InventoriesTest < ApplicationSystemTestCase
  setup do
    @inventory = inventories(:one)
  end

  test "visiting the index" do
    visit inventories_url
    assert_selector "h1", text: "Inventories"
  end

  test "should create inventory" do
    visit inventories_url
    click_on "New inventory"

    fill_in "Ingradient name", with: @inventory.ingradient_name
    fill_in "Last updated", with: @inventory.last_updated
    fill_in "Reorder quantity", with: @inventory.reorder_quantity
    fill_in "Stock quantity", with: @inventory.stock_quantity
    fill_in "Threshold", with: @inventory.threshold
    click_on "Create Inventory"

    assert_text "Inventory was successfully created"
    click_on "Back"
  end

  test "should update Inventory" do
    visit inventory_url(@inventory)
    click_on "Edit this inventory", match: :first

    fill_in "Ingradient name", with: @inventory.ingradient_name
    fill_in "Last updated", with: @inventory.last_updated
    fill_in "Reorder quantity", with: @inventory.reorder_quantity
    fill_in "Stock quantity", with: @inventory.stock_quantity
    fill_in "Threshold", with: @inventory.threshold
    click_on "Update Inventory"

    assert_text "Inventory was successfully updated"
    click_on "Back"
  end

  test "should destroy Inventory" do
    visit inventory_url(@inventory)
    click_on "Destroy this inventory", match: :first

    assert_text "Inventory was successfully destroyed"
  end
end
