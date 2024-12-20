require "application_system_test_case"

class MenusTest < ApplicationSystemTestCase
  setup do
    @menu = menus(:one)
  end

  test "visiting the index" do
    visit menus_url
    assert_selector "h1", text: "Menus"
  end

  test "should create menu" do
    visit menus_url
    click_on "New menu"

    check "Availble" if @menu.availble
    fill_in "Category", with: @menu.category
    fill_in "Description", with: @menu.description
    fill_in "Dish name", with: @menu.dish_name
    fill_in "Price", with: @menu.price
    click_on "Create Menu"

    assert_text "Menu was successfully created"
    click_on "Back"
  end

  test "should update Menu" do
    visit menu_url(@menu)
    click_on "Edit this menu", match: :first

    check "Availble" if @menu.availble
    fill_in "Category", with: @menu.category
    fill_in "Description", with: @menu.description
    fill_in "Dish name", with: @menu.dish_name
    fill_in "Price", with: @menu.price
    click_on "Update Menu"

    assert_text "Menu was successfully updated"
    click_on "Back"
  end

  test "should destroy Menu" do
    visit menu_url(@menu)
    click_on "Destroy this menu", match: :first

    assert_text "Menu was successfully destroyed"
  end
end
