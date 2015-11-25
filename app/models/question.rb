class Question < ActiveRecord::Base
  has_many :choices, dependent: :destroy
  belongs_to :exam
  validates :num_of_exam, presence: true
  validates :question_path, presence: true
  validates :description_path, presence: true
  validates :exam, presence: true
end
