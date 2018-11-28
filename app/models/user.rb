class User < ApplicationRecord
    has_many :coupons
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }

  
  end
