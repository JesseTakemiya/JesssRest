class Coupon < ApplicationRecord
    has_many :coupon_usages

    validates :code, presence: true, uniqueness: true, length: { maximum: 50 }
    validates :discount_amount, presence: true, numericality: { greater_than: 0 }
    validates :start_date, presence: true
    validate  :expiration_date_after_start_date
    validates :usage_limit, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
    validates :active, inclusion: { in: [true, false] }
  
    # Custom validation: expiration_date phải sau start_date
    private
  
    def expiration_date_after_start_date
      if expiration_date.present? && expiration_date <= start_date
        errors.add(:expiration_date, "must be after start_date")
      end
    end
end