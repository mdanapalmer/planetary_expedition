class Spaceshipastronaut < ActiveRecord::Migration[5.2]
  def change
  	create_table :spaceship_astronaut do |t|
      t.integer :spaceship_id
      t.integer :astronaut_id
  end
end
end

