class Feedback < ApplicationRecord

  belongs_to :customer

  enum rating: { poor: 1, fair: 2, good: 3, very_good: 4, excellent: 5 }
  validates :rating, presence: true
  validates :comment, length: { maximum: 500 }, allow_blank: true
  validates :date, presence: true
  validate  :date_not_in_future

  # Custom validation: date không được ở tương lai
  private

  def date_not_in_future
    if date.present? && date > Date.current
      errors.add(:date, "cannot be in the future")
    end
  end
  
end