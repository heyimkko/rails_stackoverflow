require 'spec_helper' 

describe 'as a guest on the sign in page' do 
  
  before do 
    visit root_path 
    click_link 'Signin' 
  end 
  
  let!(:user) { create(:user) }  # LET! creates database entry in test db immediately

  describe 'with valid credentials' do 
    it "should submit and reload the homepage" do 
      fill_in 'Email', :with => 'kevin@kevin.com'
      fill_in 'Password', :with => 'kevin1' 
      click_on 'Sign In' 
      page.should have_content("Hey")
      page.should have_link("Signout")
    end 

  end 

  describe 'with invalid credentials' do 
    before do 
      click_button 'Sign In'
    end 

    it 'should reload signin page' do 
      page.should have_button("Sign In") 
    end 

  end 

end
