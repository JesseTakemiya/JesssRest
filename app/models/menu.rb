class Menu < ApplicationRecord

    has_many :orders
    has_many :menu_inventory
      
    validates :dish_name, presence: true, uniqueness: true, length: { maximum: 100 }
    validates :category, presence: true, inclusion: { in: %w[Starter MainCourse Dessert Beverage] }
    validates :price, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 10000000 }
    validates :description, length: { maximum: 500 }, allow_blank: true
    validates :available, inclusion: { in: [true, false] }
  
    #truy vấn món ăn theo loại
    scope :by_category, ->(category) { where(category: category) }
  
    #tự động xử lý khi xóa món ăn
    after_destroy :update_inventory_on_delete
  
      private
  
      def update_inventory_on_delete
          menu_inventory_items.each do |menu_inventory_item|
              menu_inventory_item.inventory.update(stock_quantity: menu_inventory_item.inventory.stock_quantity + menu_inventory_item.quantity_required)
          end
      end
    
  end