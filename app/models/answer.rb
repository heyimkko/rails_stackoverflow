class Answer < ActiveRecord::Base
  attr_accessible :content, :user_id, :question_id
  belongs_to :user
  belongs_to :question

  validates :content, :presence => true, :length => { :maximum => 1000 }
  validates :user_id, :presence => true
  validates :question_id, :presence => true
end
