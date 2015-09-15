class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.integer :time_limit, default: 0
      t.integer :number_question, default: 0

      t.timestamps null: false
    end
  end
end
