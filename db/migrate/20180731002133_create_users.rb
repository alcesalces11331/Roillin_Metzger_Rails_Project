class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.boolean :admin, :default => false

      t.timestamps null: false
    end
  end
end
