class ReviewSerializer < ActiveModel::Serializer
	attributes :id, :concert_id, :comment, :rating
	belongs_to :user
	belongs_to :concert
end
