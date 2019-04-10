class ProducerSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :phone, :company, :is_technician

    has_many :events

end
