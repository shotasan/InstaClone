class PostsController < ApplicationController
  before_action :set_post, only:[:show,:edit,:update,:destroy]

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def confirm
    @post = Post.new(post_params)
    @post.user_id = current_user.id
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      PostedConfirmationMailer.posted_confirmation(@post).deliver
      redirect_to posts_path, notice:"投稿に成功しました"
    else
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @favorite = current_user.favorites.find_by(post_id: @post.id)
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
