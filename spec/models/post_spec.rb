require 'rails_helper'

describe 'Posts' do

  context 'are associated with' do

    it 'a user' do
      user = User.create(email: 'yvette@test.com', password: 'testtest', password_confirmation: 'testtest')
      post = Post.create(description: 'sunset', user_id: user.id)
      expect(post.user.email).to eq 'yvette@test.com'
    end

  end

end
