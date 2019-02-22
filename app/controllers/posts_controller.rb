class PostsController < ApplicationController
  before_action :set_post_info, only:[:show,:edit,:update,:destroy]

  def index
    @post = Post.all
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
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
    if @post.user_id != current_user.id
      redirect_to user_path(current_user.id),
      notice: "アクセス権限がありません"
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice:"編集に成功しました"
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to user_path, notice:"削除に成功しました"
  end

  private

  def set_post_info
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:text,:image,:image_cache)
  end
end