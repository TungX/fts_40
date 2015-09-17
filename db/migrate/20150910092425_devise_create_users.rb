class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :name, null: false
      t.string :chat_work, null: false
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.datetime :remember_created_at
      t.integer :role, default: 0

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
