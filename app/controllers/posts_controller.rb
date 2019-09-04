class PostsController < ApplicationController

  def index
    @posts = Post.all
  # @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @posts = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user

  end




end
