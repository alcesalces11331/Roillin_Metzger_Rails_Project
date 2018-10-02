class AddSchoolIdToSpells < ActiveRecord::Migration
  def change
    add_column :spells, :school_id, :string
  end
end
