class Astronaut < ActiveRecord::Base

	belongs_to :user

	has_many :spaceship_astronaut
	has_many :spaceships, through: :spaceship_astronaut
end
