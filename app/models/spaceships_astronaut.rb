class SpaceshipAstronaut < ActiveRecord::Base
	belongs_to :spaceship 
	belongs_to :astronaut 
end
