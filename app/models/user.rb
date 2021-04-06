class User < ActiveRecord::Base
    has_many :faves
    has_secure_password

    validates_uniqueness_of :username

end 