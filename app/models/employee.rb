class Employee < ApplicationRecord
    has_many :orders

    validates :name, presence: true, length: { maximum: 100 }
    validates :position, presence: true, inclusion: { in: %w[Manager Staff Supervisor Intern] }
    validates :phone, presence: true, numericality: true, length: { in: 10..15 }
    validate :email_domain
    
    # Kiểm tra email nhân viên
    private

    def email_domain
        if email.present? && !email.end_with?('@JessRest.com')
            errors.add(:email, "must belong to JesseRest.com domain")
        end
    end
      
end