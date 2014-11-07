require 'rails_helper'

describe 'On the post page' do

  context 'no posts should have been added' do

    it 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_content 'Add a post'
    end

  end

end
