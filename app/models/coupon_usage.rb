class CouponUsage < ApplicationRecord
  belongs_to :customer
  belongs_to :order
  belongs_to :coupon
end
