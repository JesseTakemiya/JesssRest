class CouponUsage < ApplicationRecord
  belongs_to :customer
  belongs_to :order
  belongs_to :coupon

  validates :date, presence: true
  validate :date_not_in_future
  validate :coupon_not_expired
  validate :usage_limit_not_exceeded

  # Date không được là ngày trong tương lai
  private

  def date_not_in_future
    if date.present? && date > Date.current
      errors.add(:date, "cannot be in the future")
    end
  end
  # Kiểm tra coupon hết hạn
  private
  
  def coupon_not_expired
    if coupon.expiration_date.present? && coupon.expiration_date < Date.current
      errors.add(:coupon, "has expired. This coupon cannot be used.")
    end
  end
  # Đảm bảo không sử dụng mã giảm giá quá giới hạn
  private

  def usage_limit_not_exceeded
    if coupon.usage_limit.present? && coupon.coupon_usages.count >= coupon.usage_limit
      errors.add(:coupon, "usage limit exceeded. You can no longer use this coupon.")
    end
  end
end