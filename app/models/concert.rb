
class Concert < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    validates :name, presence: true
    validates :artist, presence: true
    validates :venue, presence: true

  # binding.pry
    def self.venue_order
      @concert = Concert.order('venue ASC')
    end
end
