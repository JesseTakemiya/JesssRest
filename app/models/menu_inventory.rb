class MenuInventory < ApplicationRecord
  belongs_to :menu
  belongs_to :inventory
end
