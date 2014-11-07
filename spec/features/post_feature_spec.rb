require 'rails_helper'

describe 'On the post page' do

  context 'if there are no posts' do

    it 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_content 'Add a post'
    end

  end

  context 'users can' do

    it 'upload a post with a description and photo' do
      visit '/posts'
      post_image
      expect(page).to have_content 'sunset'
    end

    it 'delete a post' do
      visit '/posts'
      post_image
      click_link 'Delete post'
      expect(page).not_to have_content 'sunset'
    end

  end

  context 'posts display' do

    it 'the email of the user that posted it' do
      visit '/posts'
      sign_in
      visit '/posts'
      post_image
      expect(page).to have_content 'yvette@test.com'
    end

  end

  def post_image
    click_link 'Add a post'
    attach_file 'Image', File.join(Rails.root, 'spec', 'fixtures', 'files', 'sunset.jpeg')
    fill_in 'Description', with: 'sunset'
    click_button 'Post'
  end

  def sign_in
    User.create(email: 'yvette@test.com', password: 'testtest', password_confirmation: 'testtest')
    click_link 'Sign In'
    fill_in 'Email', with: 'yvette@test.com'
    fill_in 'Password', with: 'testtest'
    click_button 'Log in'
  end


end
