require 'rails_helper'

describe 'To interact with posts' do

  context 'users must' do

    it 'be signed in to post' do
      visit '/posts'
      expect(page).not_to have_content 'Add a post'
    end

  end

  context 'logged in users can' do

    before :each do
      sign_in
      visit '/posts'
      post_image
    end

    it 'upload a post with a description and photo' do
      expect(page).to have_content 'sunset'
    end


    it 'edit their own post' do
      visit '/posts'
      click_link 'sunset'
      click_link 'Edit post'
      fill_in 'Description', with: 'stunning sunset'
      click_button 'Post'
      expect(page).to have_content 'stunning sunset'
    end

    it 'delete their own post' do
      visit '/posts'
      click_link 'sunset'
      click_link 'Delete post'
      expect(page).not_to have_content 'sunset'
    end

  end

  context 'logged in users can not' do

    before do
      User.create(id: 2, email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
      Post.create(id: 2, user_id: 2, description: 'Another sunset')
    end

    it "delete other user's post" do
      sign_in
      visit '/posts'
      click_link 'Another sunset'
      expect(page).to have_content 'Another sunset'
      expect(page).not_to have_content 'Delete post'
    end

    it "edit other user's post" do
      sign_in
      visit '/posts/2'
      expect(page).not_to have_content 'Edit post'
    end

  end



end
