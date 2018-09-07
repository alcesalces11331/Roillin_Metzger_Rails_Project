class AddEnrolledToCats < ActiveRecord::Migration
  def change
    add_column :cats, :enrolled, :boolean, :default => false
  end
end
