class CouponSerializer < ActiveModel::Serializer
  attributes :info, :user_id, :id
  belongs_to :user
end
