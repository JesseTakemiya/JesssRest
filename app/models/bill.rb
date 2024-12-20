class Bill < ApplicationRecord
  belongs_to :order
  has_many :payment, dependent: :destroy

 
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: %w[unpaid paid cancelled] }
  
  # Callback để cập nhật trạng thái của hóa đơn
  after_save :update_status

  private
  def update_status
    if payment.sum(:amount) >= total_amount
     update(status: 'paid') unless status == 'cancelled'
    elsif payment.sum(:amount) > 0
      update(status: 'unpaid') unless status == 'cancelled'
    end
  end
end