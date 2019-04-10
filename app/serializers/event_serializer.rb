class EventSerializer < ActiveModel::Serializer

  attributes :id, :client, :venue, :start, :end, :techs_required, :title
  has_many :technicians, through: :event_teches
  belongs_to :producer

  class ProducerSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :phone, :company
  
  end 


  class TechnicianSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :day_rate, :audio, :video, :lighting, :general
  end



end
