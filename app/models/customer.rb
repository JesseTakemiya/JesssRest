class Customer < ApplicationRecord
    has_many :feedbacks, dependent:  :destroy
    has_many :coupon_usages, dependent:  :destroy
    has_many :orders, dependent:  :destroy
    has_many :reservations, dependent:  :destroy

    validates :name, presence: true
    validates :phone_number, presence: true, numericality: true, length: { in: 10..15 }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :time_in, presence: true
    validate  :validate_time_out
    validates :loyalty_points, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    enum membership_status: { regular: 0, silver: 1, gold: 2, platinum: 3 }
    validates :membership_status, presence: true
    private
    def validate_time_out
        if time_out.present? && time_out < time_in
          errors.add(:time_out, "must be greater than or equal to time_in")
        end
      end
end