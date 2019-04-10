class TechnicianSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :day_rate, :audio, :video, :lighting, :general, :is_technician

  has_many :events

end