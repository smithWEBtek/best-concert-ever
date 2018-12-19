class UserSerializer < ActiveModel::Serializer
	attributes :id, :email
  has_many :concerts, through: :reviews
  has_many :reviews
end
