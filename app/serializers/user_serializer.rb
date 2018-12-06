class UserSerializer < ActiveModel::Serializer
  attributes :email, :name
  has_many :coupons
end
