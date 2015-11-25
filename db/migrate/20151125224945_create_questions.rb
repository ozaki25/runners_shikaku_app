class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :num_of_exam
      t.string :question_path
      t.string :description_path
      t.references :exam

      t.timestamps null: false
    end
  end
end
