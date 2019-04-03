class User < ApplicationRecord
    has_secure_password
    has_one :technician
    has_one :producer
end

