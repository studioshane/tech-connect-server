class TechnicianSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :day_rate, :audio, :video, :lighting, :general

  belongs_to :user


  class UserSerializer < ActiveModel::Serializer
     attributes :id
  end



end
