class RemoveColumnsFromCats < ActiveRecord::Migration
  def change
    remove_column :cats, :enrolled
  end
end
