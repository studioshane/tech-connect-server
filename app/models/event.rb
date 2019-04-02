class Event < ApplicationRecord
    belongs_to :producer
    has_many :event_teches
    has_many :technicians, through: :event_teches
    
end
