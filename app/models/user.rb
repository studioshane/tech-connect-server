class User < ApplicationRecord
    has_secure_password
    has_one :technician
    has_one :producer

    validates :email, {presence: true, uniqueness: true}
    validates :password, {presence: true}



end

