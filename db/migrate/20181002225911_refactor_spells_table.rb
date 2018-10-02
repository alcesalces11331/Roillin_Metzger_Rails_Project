class RefactorSpellsTable < ActiveRecord::Migration
  def change
    add_column :spells, :fire, :boolean, :default => false
    add_column :spells, :water, :boolean, :default => false
    add_column :spells, :earth, :boolean, :default => false
    add_column :spells, :lightning, :boolean, :default => false
    add_column :spells, :ice, :boolean, :default => false
    add_column :spells, :poison, :boolean, :default => false
    add_column :spells, :death, :boolean, :default => false
    add_column :spells, :psychic, :boolean, :default => false
    add_column :spells, :acid, :boolean, :default => false
    add_column :spells, :wind, :boolean, :default => false
  end
end
