class Technician < ApplicationRecord
    belongs_to :user
    has_many :event_teches
    has_many :events, through: :event_teches
end
