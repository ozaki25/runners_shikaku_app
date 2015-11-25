class Category < ActiveRecord::Base
  has_many :exams, dependent: :destroy
  validates :name, presence: true
end
