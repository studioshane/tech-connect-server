class Technician < ApplicationRecord
    has_many :event_teches
    has_many :events, through: :event_teches
end
