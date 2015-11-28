class AddChoiceToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :choice_path, :string
    add_column :questions, :collect_no, :string
  end
end
