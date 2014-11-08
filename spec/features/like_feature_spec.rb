require 'rails_helper'

describe 'Users can like posts' do

  before do
    sign_in
    post_image
  end

  it 'from the posts index page' do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end
