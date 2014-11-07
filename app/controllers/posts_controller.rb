class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def post_params
    if user_signed_in?
      @user_id = current_user.id
    else
      @user_id = nil
    end
    params.require(:post).permit(:description, :image).merge(user_id: @user_id)
  end


  def create
    Post.create(post_params)
    redirect_to '/posts'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to  '/posts'
  end

end
