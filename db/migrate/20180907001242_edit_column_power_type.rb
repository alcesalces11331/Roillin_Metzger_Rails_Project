class EditColumnPowerType < ActiveRecord::Migration
  def change
    change_table :spells do |t|
      t.change_default(:power_type, [])
    end
  end
end
