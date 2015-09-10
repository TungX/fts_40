class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.time :time_start
      t.time :time_end
      t.integer :state
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
