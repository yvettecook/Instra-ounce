class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
    Post.create(params[:post].permit(:description, :image))
    redirect_to '/posts'
  end

end
