class PostsController < ApplicationController
  before_action :set_post, only:[:show,:edit,:update,:destroy]

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def confirm
    @post = current_user.posts.new(post_params)
    render :new if @post.invalid?
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      PostedConfirmationMailer.posted_confirmation(@post).deliver
      redirect_to posts_path, notice:"投稿に成功しました"
    else
      render :new
    end
  end

  def show
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
    redirect_to user_path
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:text,:image,:image_cache)
  end
end
