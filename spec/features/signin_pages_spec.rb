require 'rails_helper'

describe "signing in" do
  it "signs a user in if password correct" do
    visit 'login'
    user = User.create(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    expect(page).to have_content 'Logged in'
  end

  it "shows error with wrong password" do
    visit '/sessions/new'
    user = User.create(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'wrong'
    click_button 'Log In'
    expect(page).to have_content 'invalid'
  end

  it "show an error with a blank password field." do
    visit 'login'
    fill_in 'Email', :with => 'user@example.com'
    click_button 'Log In'
    expect(page).to have_content 'invalid'
  end

  it "show an error with a blank email field." do
    visit 'login'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    expect(page).to have_content 'invalid'
  end
end
