class CouponSerializer < ActiveModel::Serializer
  attributes :info, :user_id
  belongs_to :user
end
