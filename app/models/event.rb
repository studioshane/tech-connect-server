class Event < ApplicationRecord
    belongs_to :producer
    has_many :event_teches
    has_many :technicians, through: :event_teches

  #   extend Generator

  # def self.build_event
  #   new_event = Event.new(generate_event )

  #   new_event.save
  # end

    
end
