class Manager < ActiveRecord::Base
    has_secure_password
    has_many :team_stats 
end