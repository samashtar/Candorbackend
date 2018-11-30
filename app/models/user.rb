class User < ApplicationRecord
    has_many :coupons
    has_secure_password

  
  end
