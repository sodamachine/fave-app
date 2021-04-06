class User < ActiveRecord::Base
    has_many :faves
    has_secure_password

end 