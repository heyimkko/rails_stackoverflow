require 'spec_helper'

describe User do
  let(:user) { create(:user) }

  subject { user }
  it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :password_digest }
  it { should validate_presence_of :password }
  it { should validate_format_of(:email).not_with('znz@.ca...a.zx') }
  it { should validate_format_of(:email).with('znz@zx.com') }
  it { should validate_format_of(:email).with('Znz@Zx.com') }

  it "name cannot be less than 3 characters" do
    user.name = "Kk"
    user.should_not be_valid  
  end

  it "name cannot be more than 50 characters" do
    user.name = "a" * 51
    user.should_not be_valid
  end

  it "password cannot be less than 6 characters" do
    user.password = "a" * 5
    user.should_not be_valid
  end

  it "email should be downcased before case" do
    user.email = "KeviN@kO.coM"
    user.save!
    user.email.should eq "kevin@ko.com"
  end
end
