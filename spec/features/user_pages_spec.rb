require 'rails_helper'

describe 'user signed in actions' do

  it 'should allow users to post a photo from their profile page.' do
    visit 'login'
    user = User.create(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    expect(page).to have_content "Post a Photo"
    click_link 'Post a Photo'
    expect(page).to have_content "New Post"
  end

  it 'should allow users to view their photos from the profile page.' do
    visit 'login'
    user = User.create(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    expect(page).to have_content "View all Your Posts"
    click_link 'View all Your Posts'
    expect(page).to have_content "Pictures from you"
  end

  it 'should allow users to view all photos from all users.' do
    visit 'login'
    user = User.create(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    click_link 'View all Posts From Everyone!'
    expect(page).to have_content "All Pictures"
  end

end
