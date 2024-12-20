require "application_system_test_case"

class CouponUsagesTest < ApplicationSystemTestCase
  setup do
    @coupon_usage = coupon_usages(:one)
  end

  test "visiting the index" do
    visit coupon_usages_url
    assert_selector "h1", text: "Coupon usages"
  end

  test "should create coupon usage" do
    visit coupon_usages_url
    click_on "New coupon usage"

    fill_in "Coupon", with: @coupon_usage.coupon_id
    fill_in "Customer", with: @coupon_usage.customer_id
    fill_in "Date", with: @coupon_usage.date
    fill_in "Order", with: @coupon_usage.order_id
    click_on "Create Coupon usage"

    assert_text "Coupon usage was successfully created"
    click_on "Back"
  end

  test "should update Coupon usage" do
    visit coupon_usage_url(@coupon_usage)
    click_on "Edit this coupon usage", match: :first

    fill_in "Coupon", with: @coupon_usage.coupon_id
    fill_in "Customer", with: @coupon_usage.customer_id
    fill_in "Date", with: @coupon_usage.date
    fill_in "Order", with: @coupon_usage.order_id
    click_on "Update Coupon usage"

    assert_text "Coupon usage was successfully updated"
    click_on "Back"
  end

  test "should destroy Coupon usage" do
    visit coupon_usage_url(@coupon_usage)
    click_on "Destroy this coupon usage", match: :first

    assert_text "Coupon usage was successfully destroyed"
  end
end
