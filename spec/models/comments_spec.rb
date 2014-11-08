require 'rails_helper'

describe 'Comments' do

  context 'are associated with' do

    before do
      @user = User.create(email: 'yvette@test.com', password: 'testtest', password_confirmation: 'testtest')
      @post = Post.create(description: 'sunset', user_id: @user.id)
      @comment = Comment.create(post_id: @post.id, content: 'Bored of sunsets', user_id: @user.id)
    end

    it 'a user' do
      expect(@post.comments.first.user.email).to eq 'yvette@test.com'
    end

  end

end
