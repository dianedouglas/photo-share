require 'rails_helper'

describe "new post form page" do

  it "should post a photo and go to the user posts page if the fields are both filled in." do
    visit 'login'
    user = User.create(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    click_link 'Post a Photo'
    expect(page).to have_content "New Post"
    fill_in 'post_description', :with => 'my photo'
    page.attach_file('post_image_upload', 'rat_flute.gif')
    click_button 'Post'
    expect(page.find('img')['src']).to have_content 'rat_flute.gif'
  end

  it "should allow a user to post a photo either from the home page or their profile page, if signed in." do
    visit 'login'
    user = User.create(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    click_link 'Post a Photo!'
    expect(page).to have_content "New Post"
    click_link 'Pictures of You'
    click_link 'Post a Photo!'
    expect(page).to have_content "New Post"
  end
end
