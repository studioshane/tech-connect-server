class EventTech < ApplicationRecord
    belongs_to :event
    belongs_to :technician
end