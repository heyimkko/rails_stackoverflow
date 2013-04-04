class Answer < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :question

  validates :content, :presence => true, :length => { :maximum => 1000 }
  validates :user, :presence => true
  validates :question, :presence => true
end
