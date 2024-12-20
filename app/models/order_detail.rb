class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :menu

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :note, length: { maximum: 300 }, allow_blank: true
  validates :status, presence: true, inclusion: { in: %w[pending prepared served cancelled] }
 
  #Xử lí món ăn bị xóa hoặc không còn trong kho
  validate :menu_item_available
  private
  def menu_item_available
    if menu && !menu.available?
     errors.add(:menu, "is no longer available")
   end
  end

  #tính toán khi có mã giảm giá
  def calculate_discount
    if order.coupon.present?
      self.price -= self.price * order.coupon.discount_amount / 100
    end
  end
  
  #tự động cập nhật khi xóa orderdetail
  after_destroy :update_order_total

  private
  def update_order_total
    order.update(total_amount: order.order_details.sum('price * quantity'))
  end
end