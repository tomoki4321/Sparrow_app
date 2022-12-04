class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post=Post.new
  end
  
  def create
    @post=current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path flash[:notice]= "ブログを作成しました！"
      else
        render :new
      end
    end
  end

  def show
    @post=Post.find(params[:id])
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, flash[:notice]= "ブログを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, flash[:notice]="ブログを削除しました！"
  end

  def confirm
    @post=current_user.posts.build(post_params)
    render :new if @post.invalid?
  end
  private
  
  def post_params
    params.require(:post).permit(:content,:picture,:picture_cache)
  end
end
