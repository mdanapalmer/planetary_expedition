class AddColumnToSpaceshipsForCrew < ActiveRecord::Migration[5.2]
  def change
  	add_column :spaceships, :crew_member, :string
  end
end
