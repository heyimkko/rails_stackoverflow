class User < ActiveRecord::Base
  EMAIL_REGEXP = /^[_a-z0-9A-Z-]+(\.[_a-z0-9A-Z-]+)*@[a-z0-9A-Z-]+(\.[a-z0-9A-Z-]+)*(\.[a-zA-Z]{2,4})$/
  attr_accessible :name, :email, :password
  has_secure_password

  validates :name, :presence => true, :length => { :minimum => 3, :maximum => 50 }
  validates :email, :presence => true, 
            :format => { :with => EMAIL_REGEXP }, 
            uniqueness: { case_sensitive: false }
  validates :password, :presence => true, :length => { :minimum => 6 }

  before_save :downcase_email

  def downcase_email
    self.email = self.email.downcase
  end
end
