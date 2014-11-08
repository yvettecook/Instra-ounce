require 'rails_helper'

describe 'On the post page' do

  context 'if there are no posts' do

    it 'should display a prompt to add a post' do
      sign_in
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_content 'Add a post'
    end

  end

  context 'users must' do

    it 'be signed in to posts ' do
      visit '/posts'
      expect(page).not_to have_content 'Add a post'
    end

  end

  context 'logged in users can' do

    before do
      sign_in
      visit '/posts'
      post_image
    end

    it 'upload a post with a description and photo' do
      expect(page).to have_content 'sunset'
    end

    it 'delete their own post' do
      click_link 'Delete post'
      expect(page).not_to have_content 'sunset'
    end

    it 'edit their own post' do
      click_link 'Edit post'
      fill_in 'Description', with: 'stunning sunset'
      click_button 'Post'
      expect(page).to have_content 'stunning sunset'
    end

  end

  context 'logged in users can not' do

    before do
      User.create(id: 2, email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
      Post.create(user_id: 2, description: 'Another sunset')
    end

    it "delete other user's post" do
      sign_in
      visit '/posts'
      expect(page).to have_content 'Another sunset'
      expect(page).not_to have_content 'Delete post'
    end

    it "edit other user's post" do
      sign_in
      visit '/posts'
      expect(page).not_to have_content 'Edit post'
    end

  end

  context 'posts display' do

    before do
      User.create(id: 2, email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
      Post.create(user_id: 2, description: 'Another sunset')
    end

    it 'all if not logged in' do
      visit '/posts'
      expect(page).to have_content 'Another sunset'
    end

    it 'the email of the user that posted it' do
      visit '/posts'
      expect(page).to have_content 'test@test.com'
    end

  end

  

end
