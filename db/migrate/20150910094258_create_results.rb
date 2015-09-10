class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.boolean :correct
      t.references :examp, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :option, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
