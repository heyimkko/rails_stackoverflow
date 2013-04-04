module CapybaraHelpers
  def login
    visit root_path
    click_link 'Signin' 
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => 'kevin1' 
    click_on 'Sign In' 
  end
end
