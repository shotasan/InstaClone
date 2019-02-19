class PostsController < ApplicationController
  def new
    @post = Post.new
  end


  private

  def post_params
    params.require(:post).permit(:text,:image)
  end
end
