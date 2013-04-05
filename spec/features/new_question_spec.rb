require 'spec_helper' 

describe 'Attempting to add a new question', :js => true do   
  describe 'when logged in' do 
    let!(:user) { create(:user) }
    before(:each) do
      login
      click_link 'Add a Question'
    end

    it "should send user to new question form" do
      page.should have_content("Add a Question")
    end

    it "shouldn't take a title greater than 5 characters" do
      fill_in 'Title', :with => "a" * 1
      click_button 'Add Question' 
      page.should have_content("Title is too short")
    end

    it "shouldn't take content greater than 5 characters" do
      fill_in 'Content', :with => "b" * 1
      click_button 'Add Question'
      page.should have_content("Content is too short")
    end

    it "should submit with a valid title" do
      fill_in 'Title', :with => "a" * 10
      fill_in 'Content', :with => "Capybara Runs"
      click_button 'Add Question'
      current_path.should eq(question_path)
      page.should have_content("Q: aaaaaaaaaa")
    end

    it "should submit with valid content" do
      fill_in 'Title', :with => "Capybara Runs"
      fill_in 'Content', :with => "b" * 10
      click_button 'Add Question'
      current_path.should eq(question_path)
      page.should have_content("Q: Capybara Runs")
      page.should have_content("bbbbbbbbbb")
    end
  end

  describe 'as a guest' do
    it "should redirect to login page" do
      current_path.should eq(new_session_path)
    end
  end
end
