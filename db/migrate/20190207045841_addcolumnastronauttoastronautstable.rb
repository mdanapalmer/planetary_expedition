class Addcolumnastronauttoastronautstable < ActiveRecord::Migration[5.2]
  def change
    add_column :astronauts, :astronaut, :string
    end
end
