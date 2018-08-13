class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :cats, :type, :type_of
  end
end
