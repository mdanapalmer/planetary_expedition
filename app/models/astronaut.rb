class Astronaut < ActiveRecord::Base
	belongs_to :user
	belongs_to :spaceships
end
