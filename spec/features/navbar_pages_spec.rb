require 'rails_helper'

describe "clicking links on the navbar" do

  it "should take you back to the root when the brand is clicked on." do
    visit 'signup'
    click_link 'Pictures of You'
    expect(page).to have_content "Pictures of You"
  end

  it "should take you to signup when you click the Sign Up link." do
    visit '/'
    click_link 'Sign Up'
    expect(page).to have_content "Password confirmation"
  end

  it "should take you to login when you click the Log In link." do
    visit '/'
    click_link 'Log In'
    expect(page).to have_content "Log In Email Password"
  end

  it "should not show you the Profile link if the user is not signed in." do
    visit '/'
    expect(page).to have_no_content "Profile"
    expect(page).to have_no_content "Post a Photo"
  end

  it "should not show you the Profile link if the user is not signed in." do
    visit 'login'
    user = User.create(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    visit '/'
    expect(page).to have_content "Profile"
    expect(page).to have_content "Post a Photo"
  end
end
