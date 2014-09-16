require 'rails_helper'

describe "signing up" do
  it "sign a user up with valid email and password." do
    visit 'signup'
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign Up'
    expect(page).to have_content 'Welcome'
  end

  it "show an error with a blank password field." do
    visit 'signup'
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign Up'
    expect(page).to have_content 'errors'
  end

  it "show an error with a blank password and password confirmation field." do
    visit 'signup'
    fill_in 'Email', :with => 'user@example.com'
    click_button 'Sign Up'
    expect(page).to have_content 'errors'
  end

  it "show an error with a blank email field, but correct password and password confirmation field." do
    visit 'signup'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign Up'
    expect(page).to have_content 'errors'
  end
end
