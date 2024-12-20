require "test_helper"

class CouponUsagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coupon_usage = coupon_usages(:one)
  end

  test "should get index" do
    get coupon_usages_url
    assert_response :success
  end

  test "should get new" do
    get new_coupon_usage_url
    assert_response :success
  end

  test "should create coupon_usage" do
    assert_difference("CouponUsage.count") do
      post coupon_usages_url, params: { coupon_usage: { coupon_id: @coupon_usage.coupon_id, customer_id: @coupon_usage.customer_id, date: @coupon_usage.date, order_id: @coupon_usage.order_id } }
    end

    assert_redirected_to coupon_usage_url(CouponUsage.last)
  end

  test "should show coupon_usage" do
    get coupon_usage_url(@coupon_usage)
    assert_response :success
  end

  test "should get edit" do
    get edit_coupon_usage_url(@coupon_usage)
    assert_response :success
  end

  test "should update coupon_usage" do
    patch coupon_usage_url(@coupon_usage), params: { coupon_usage: { coupon_id: @coupon_usage.coupon_id, customer_id: @coupon_usage.customer_id, date: @coupon_usage.date, order_id: @coupon_usage.order_id } }
    assert_redirected_to coupon_usage_url(@coupon_usage)
  end

  test "should destroy coupon_usage" do
    assert_difference("CouponUsage.count", -1) do
      delete coupon_usage_url(@coupon_usage)
    end

    assert_redirected_to coupon_usages_url
  end
end
