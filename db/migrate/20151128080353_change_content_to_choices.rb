class ChangeContentToChoices < ActiveRecord::Migration
  def change
    rename_column :choices, :content, :choice_path
  end
end
