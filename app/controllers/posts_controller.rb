class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params[:post].permit(:description, :image))
    redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit(:description, :image).merge(user_id: get_user_id)
  end

  def get_user_id
    return current_user.id if user_signed_in?
    return nil
  end

end
