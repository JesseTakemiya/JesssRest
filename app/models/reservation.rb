class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :table

  validates :date, presence: true
  validate :date_not_in_past
  validates :time, presence: true
  validates :number_of_guest, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 50 }
  validates :status, presence: true, inclusion: { in: %w[pending confirmed cancelled] }

  validate :table_available_at_time, on: :create

  enum status: { pending: 0, confirmed: 1, cancelled: 2 }

  # Custom validation: date không được là ngày trong quá khứ
  private

  def date_not_in_past
    if date.present? && date < Date.current
      errors.add(:date, "cannot be in the past")
    end
  end

  # Custom validation: kiểm tra xem bàn đã được đặt chưa
  def table_available_at_time
    if table.reservations.where(date: date, time: time).exists?
      errors.add(:time, "is already booked for this table on this date")
    end
  end
end