class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.boolean :correct
      t.references :exam, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :option, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :results, :id
  end
end
