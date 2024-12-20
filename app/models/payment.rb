class Payment < ApplicationRecord

  belongs_to :bill

  validates :method, presence: true, inclusion: { in: %w[cash credit_card debit_card online] }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :date, presence: true
  validate :date_not_in_future

  # Custom validation: date không được là ngày trong tương lai
  private

  def date_not_in_future
    if date.present? && date > Date.current
      errors.add(:date, "cannot be in the future")
    end
  end
 
  #kiểm tra số tiền thanh toán có lớn hơn số tiền trong hóa đơn
  validate :amount_not_exceeding_bill

  private

  def amount_not_exceeding_bill
    if amount.present? && amount > bill.total_amount
      errors.add(:amount, "cannot be greater than the bill's total amount")
    end
  end

  #tự động cập nhập trạng thái hóa đơn
  after_save :update_bill_status

  private

  def update_bill_status
    if bill.payments.sum(:amount) >= bill.total_amount
      bill.update(status: 'paid')
    end
  end

  #thêm phương thức xử lý hoàn tiền
  def refund(amount)
    if amount <= self.amount
      self.amount -= amount
      self.save
      bill.update(status: 'refunded') if bill.payments.sum(:amount) == 0
    else
      errors.add(:amount, "refund amount cannot exceed payment amount")
    end
  end

  #kiểm tra trạng thái thanh toán
  after_save :check_full_payment

  private

  def check_full_payment
    if bill.payments.sum(:amount) >= bill.total_amount
      bill.update(status: 'paid')
    else
      bill.update(status: 'partially_paid')
    end
  end

end
