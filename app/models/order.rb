class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :table
  belongs_to :employee
end
