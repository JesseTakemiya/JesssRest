class Inventory < ApplicationRecord

    has_many :menu_inventory, dependent:  :destroy
  
    validates :ingredient_name, presence: true, uniqueness: true, length: { maximum: 100 }
    validates :stock_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :threshold, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validate :threshold_within_stock_quantity
    validates :reorder_quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :last_updated, presence: true
    validate :last_updated_not_in_future

    # Custom validation: threshold phải nhỏ hơn hoặc bằng stock_quantity
    private

    def threshold_within_stock_quantity
        if threshold.present? && stock_quantity.present? && threshold > stock_quantity
        errors.add(:threshold, "must be less than or equal to stock quantity")
        end
    end

    # Custom validation: last_updated không được ở tương lai
    def last_updated_not_in_future
        if last_updated.present? && last_updated > Time.zone.now
            errors.add(:last_updated, "cannot be in the future")
        end
    end
end