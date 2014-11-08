require 'rails_helper'

describe 'Posts' do

  context 'are associated with' do

    before do
      user = User.create(email: 'yvette@test.com', password: 'testtest', password_confirmation: 'testtest')
      @post = Post.create(description: 'sunset', user_id: user.id)
    end

    it 'a user' do
      expect(@post.user.email).to eq 'yvette@test.com'
    end

    it 'comments' do
      @comment = Comment.create(post_id: @post.id, content: 'Bored of sunsets')
      expect(@post.comments.count).to eq 1
      expect(@post.comments.first.content).to eq 'Bored of sunsets'
    end

  end

end
