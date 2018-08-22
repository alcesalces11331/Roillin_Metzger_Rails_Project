class CreateSpells < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.string :name
      t.string :cat_id
      t.text :description
      t.string :power_type
      t.integer :power_level
    end
  end
end
