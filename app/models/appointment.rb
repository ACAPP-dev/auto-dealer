class Appointment < ApplicationRecord

    include ActiveModel::Validations

    belongs_to :customer
    belongs_to :employee

    validates :description, :appt_date, :appt_time, presence: true

    validates_with ApptDateValidator
    validates_with ApptTimeValidator
  
    def self.order_by_date
        order(appt_date: :asc)
    end
end
