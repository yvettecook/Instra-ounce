require 'rails_helper'

describe 'On the homepage' do

  context 'a new user wanting to sign up' do

    it 'can click on the sign up button' do
      visit '/'
      click_link 'Sign Up'
      expect(page).to have_content 'Email'
      expect(page).to have_content 'Password'
      expect(page).to have_content 'Password confirmation'
    end

  end

end
