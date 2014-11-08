class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new(user: current_user)
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create((comment_params).merge(user_id: current_user.id))
    redirect_to post_path(@post)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
