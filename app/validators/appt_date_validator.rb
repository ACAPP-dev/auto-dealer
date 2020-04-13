class ApptDateValidator < ActiveModel::Validator 
    def validate(appointment)
        unless appointment.appt_date >= DateTime.now.strftime("%Y-%m-%d")
            appointment.errors[:appt_date] << "Date must be today or for a future date."
        end
    end
end