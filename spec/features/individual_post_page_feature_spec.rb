require 'rails_helper'

describe 'On the individual post page' do

  before do
    sign_in
    post_image
  end

  it 'displays the user email address' do
   visit '/posts'
   click_link 'sunset'
   expect(page).to have_content 'yvette@test.com'
  end

  it 'allows users to place comments' do
    visit '/posts'
    click_link 'sunset'
    click_link 'Comment'
    fill_in 'Content', with: 'Bored of sunsets'
    click_button 'Comment'
    expect(page).to have_content 'Bored of sunsets'
  end

  it "displays comment's user's email" do
    sign_in_other
    visit '/posts'
    click_link 'sunset'
    click_link 'Comment'
    fill_in 'Content', with: 'Bored of sunsets'
    click_button 'Comment'
    expect(page).to have_content 'test@test.com'
  end

  def sign_in_other
    User.create(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
    visit '/'
    click_link 'Sign Out'
    click_link 'Sign In'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'testtest'
    click_button 'Log in'
  end


end
