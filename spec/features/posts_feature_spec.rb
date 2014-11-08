require 'rails_helper'

describe 'On the posts index page' do

  context 'if there are no posts' do

    it 'should display a prompt to add a post' do
      sign_in
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_content 'Add a post'
    end

  end

  context 'the page displays' do

    before do
      User.create(id: 2, email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
      Post.create(user_id: 2, description: 'Another sunset')
    end

    it 'all posts' do
      visit '/posts'
      expect(page).to have_content 'Another sunset'
    end

    it 'the email of the user that posted it' do
      visit '/posts'
      expect(page).to have_content 'test@test.com'
    end

  end

end
