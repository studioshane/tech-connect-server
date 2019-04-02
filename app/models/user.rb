class User < ApplicationRecord
    has_one :technician
    has_one :producer
end
