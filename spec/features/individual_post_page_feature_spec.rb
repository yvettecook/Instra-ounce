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

end
