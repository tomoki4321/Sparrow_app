class PostsController < ApplicationController
  def index

  end

  def new
    @post=Post.new
  end
  
  def create
    @post=Post.new(post_params)
    if @post.save
      redirect_to posts_path notice: "ブログを作成しました！"
    else
      render :new
    end
  end
  private
  
  def post_params
    params.require(:post).permit(:content,:picture,:picture_cache)
  end
end
