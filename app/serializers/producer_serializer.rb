class ProducerSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :phone, :company

  belongs_to :user


  class UserSerializer < ActiveModel::Serializer
     attributes :id
  end


end
