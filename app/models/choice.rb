class Choice < ActiveRecord::Base
  belongs_to :question
  enumerize :collect, { collect: 'true', incollect: 'false' }, scope: true
  validates :content, presence: true
end
