class Manager < ActiveRecord::Base
    has_secure_password
    has_many :team_stats 

    def slug 
        username.downcase.gsub(" ", "-")
    end 
      
    def self.find_by_slug(slug)
        binding.pry
        Manager.all.find{|manager| manager.slug == slug}
    end 

end