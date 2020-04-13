class ApptTimeValidator < ActiveModel::Validator 
    
    def validate(appointment)
        if appointment.appt_date == DateTime.now.strftime("%Y-%m-%d")
            unless appointment.appt_time >= (DateTime.now + 1.hours).strftime("%H:%M")
                appointment.errors[:appt_time] << "Time must be at least an hour later than the current time."
            end
        end
    end

end