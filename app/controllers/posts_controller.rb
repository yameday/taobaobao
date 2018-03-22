class PostsController < ApplicationController

  before_action :find_post, only: [:edit, :update]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to root_path
      # temporary use
    else
      render :edit
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :photo, :url, :description, :delivery, :price, :goal, :due_time)
  end

end
