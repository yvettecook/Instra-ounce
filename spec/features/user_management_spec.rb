require 'rails_helper'

describe 'On the homepage' do

  context 'a new user' do

    it 'can click on the sign up button' do
      visit '/'
      click_link 'Sign Up'
      expect(page).to have_content 'Email'
      expect(page).to have_content 'Password'
      expect(page).to have_content 'Password confirmation'
    end

  end

  context 'a registered user' do

    before do
      User.create(email: 'yvette@test.com', password: 'testtest', password_confirmation: 'testtest')
    end

    it 'can log in' do
      visit '/'
      sign_in
      expect(page).to have_content 'Sign Out'
    end

    it 'can log out' do
      visit '/'
      sign_in
      click_link 'Sign Out'
      expect(page).to have_content 'Sign In'
    end

  end

end
