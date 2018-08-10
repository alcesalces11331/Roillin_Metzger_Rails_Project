class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.string :type
      t.integer :age
      t.string :user_id
      t.string :school_id
      t.boolean :enrolled, :default => false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
