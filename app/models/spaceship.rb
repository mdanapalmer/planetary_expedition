class Spaceship < ActiveRecord::Base
  belongs_to :user

  has_many :spaceship_astronaut
  has_many :astronauts, through: :spaceship_astronaut
end
