class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :time_start
      t.integer :time_end
      t.integer :state, default: 0
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
