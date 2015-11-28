class Choice < ActiveRecord::Base
  belongs_to :question
  validates :choice_path, presence: true
end
