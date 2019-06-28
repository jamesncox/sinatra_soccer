class Manager < ActiveRecord::Base
    has_secure_password
    has_many :team_stats 

    def slug 
        username.downcase.gsub(" ", "-")
    end 
      
    def self.find_by_slug(slug)
        Manager.all.find do |manager|
            # binding.pry
            manager.slug == slug.downcase
        end
    end 

end