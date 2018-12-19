class ConcertSerializer < ActiveModel::Serializer
	attributes :id, :name, :artist, :venue
	has_many :reviews
	has_many :users, through: :reviews

end
