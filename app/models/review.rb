class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :concert
 
  #custom_writer
  def concert_attributes=(concert_attributes)
    self.create_concert(concert_attributes) if concert_id.nil?
  end
end