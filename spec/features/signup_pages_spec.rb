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
end
