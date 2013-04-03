require 'spec_helper'

describe Question do
  let(:question) {FactoryGirl.create(:question) }

  subject { question }

  it { should be_valid }
  it { should respond_to :title }
  it { should respond_to :content }
  it { should respond_to :user_id }
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_presence_of :user_id }

  it "title cannot be less than 5 characters" do
    question.title = "dd"
    question.should_not be_valid
  end

  it "title cannot be more than 100 characters" do
    question.title = "d" * 101
    question.should_not be_valid
  end

  it "content cannot be less than 5 characters" do
    question.content = "dd"
    question.should_not be_valid
  end  


end
