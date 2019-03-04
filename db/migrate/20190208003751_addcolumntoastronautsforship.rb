class Addcolumntoastronautsforship < ActiveRecord::Migration[5.2]
  def change
    add_column :astronauts, :ship, :string
  end
end
