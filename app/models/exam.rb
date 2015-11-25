class Exam < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  belongs_to :category
  validates :time_of_category, presence: true
  validates :category, presence: true
end
