class Question < ActiveRecord::Base

  attr_accessible :title, :content, :user_id

  belongs_to :user
  has_many :answers

  validates :title, :presence => true, :length => {:minimum => 5, :maximum => 100 }
  validates :content, :presence => true, :length => {:minimum => 5 }
  validates :user_id, :presence => true
end
