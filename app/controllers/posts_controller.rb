class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post has been successfully updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destoy
    @post = Post.find(params[:id])
    @post.destoy
    flash[:notice] = "Post was deleted"
    redirect_to posts_path
  end



  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Your Post was created successfully"
    redirect_to post_path(@post)
  else
    render 'new'
  end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

end
