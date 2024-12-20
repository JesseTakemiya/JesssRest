class Table < ApplicationRecord

  belongs_to :reservation

  validates :table_number, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10 }
  validates :status, presence: true, inclusion: { in: %w[available occupied reserved out_of_service] }

end