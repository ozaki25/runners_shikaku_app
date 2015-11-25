class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :time_of_category
      t.references :category

      t.timestamps null: false
    end
  end
end
