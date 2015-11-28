class Question < ActiveRecord::Base
  belongs_to :exam
  validates :num_of_exam, presence: true
  validates :question_path, presence: true
  validates :description_path, presence: true
  validates :exam, presence: true
end
