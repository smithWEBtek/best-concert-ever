module ApplicationHelper
    
 def show_best_concert(best_concert)
     concert.each do |concert|
      link_to best_conert.concert.name, concert_path(best_concert.concert)
    end
 end

  def top_rated(user)
    if user.best_concert.nil?
      "No Concert Reviews"
    else
      user.best_concert.concert.name 
    end
  end
end
