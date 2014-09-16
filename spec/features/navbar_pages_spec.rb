require 'rails_helper'

describe "clicking links on the navbar" do

  it "should take you back to the root when the brand is clicked on." do
    visit 'signup'
    click_link 'Pictures of You'
    expect(page).to have_content "I've been staring so long at these..."
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
end
