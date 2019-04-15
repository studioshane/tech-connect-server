class Technician < ApplicationRecord
    belongs_to :user
    has_many :event_teches
    has_many :events, through: :event_teches



    def self.is_available_between(start_date, end_date)
        Technician.all.select{|tech| tech.is_available_between(start_date, end_date)}
    end

    def is_available_between(start_date, end_date)
        date_range = [start_date..end_date]
        date_range.select{|date| self.is_available_on(date)}.count == date_range.count
    end

    def is_available_on(date)
        self.events.select{|event| [event.start..event.end].include? date }.count == 0
    end
end