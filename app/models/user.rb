class User < ApplicationRecord
    # validates :password_digest, presence: true
    has_secure_password
end
