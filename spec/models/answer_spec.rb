require 'spec_helper'

describe Answer do
  let(:answer) { create(:answer) }

  subject { answer }

  it { should be_valid }
  it { should respond_to :content }
  it { should respond_to :user_id }
  it { should respond_to :question_id }
  it { should validate_presence_of :content }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :question_id }

  it "answer cannot be more than 1000 characters" do
    answer.content = "e" * 1001
    answer.should_not be_valid
  end
end
