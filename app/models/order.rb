class Order < ApplicationRecord

  belongs_to :customer
  belongs_to :table
  belongs_to :employee
  has_many :order_details
  has_one :bill

  validates :time, presence: true
  validate :time_not_in_future
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :discount_amount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: :total_amount }, allow_nil: true
  validates :status, presence: true, inclusion: { in: %w[pending completed cancelled] }

  # Custom validation: time không được là thời gian trong tương lai
  private

  def time_not_in_future
    if time.present? && time > Time.current
      errors.add(:time, "cannot be in the future")
    end
  end

  #tính tổng đơn hàng tự động
  after_save :update_total_amount

  private
  def update_total_amount
    self.total_amount = order_details.sum('price * quantity')
    save
  end

  #tính toán giá trị mã giảm giá
  before_save :apply_discount

  private
  def apply_discount
    if discount_amount.present?
      self.total_amount -= discount_amount
    end
  end
  
  #xử lí khi đơn hàng bị hủy
  after_update :handle_cancelled_order, if: :cancelled?

  private
  def handle_cancelled_order
    # Xử lý khi đơn hàng bị hủy, chẳng hạn như hoàn tiền hoặc thay đổi trạng thái
    bill.update(status: 'cancelled') if bill.present?
  end

end