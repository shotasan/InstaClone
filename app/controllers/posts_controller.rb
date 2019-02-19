class PostsController < ApplicationController
  before_action :set_post, only:[:edit,:update,:destroy]

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      PostedConfirmationMailer.posted_confirmation(@post).deliver
      redirect_to posts_path, notice:"投稿に成功しました"
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:text,:image,:image_cache)
  end
end
