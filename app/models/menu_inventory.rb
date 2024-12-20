class MenuInventory < ApplicationRecord

  belongs_to :menu
  belongs_to :inventory

  validates :quantity_required, presence: true, numericality: { only_integer: true, greater_than: 0 }

  #Kiểm tra lượng nguyên liệu trong kho
  validate :sufficient_inventory
  private

  def sufficient_inventory
    if inventory.present? && inventory.stock_quantity < quantity_required
      errors.add(:quantity_required, "cannot exceed available stock in inventory")
    end
  end

  #Tự động cập nhật thông tin tồn kho
  after_save :update_inventory_stock

  private

  def update_inventory_stock
    if inventory.present? && quantity_required.present?
      inventory.update(stock_quantity: inventory.stock_quantity - quantity_required)
    end
  end

  #Truy vấn thông tin
  scope :for_menu, ->(menu_id) { where(menu_id: menu_id) }
  scope :for_inventory, ->(inventory_id) { where(inventory_id: inventory_id) }

end