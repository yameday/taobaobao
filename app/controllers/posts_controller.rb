class PostsController < ApplicationController
  before_action :authenticate_user!, except:  [:index, :search]
  before_action :find_post, only: [:show, :edit, :update, :participate, :unparticipate, :postend]
  
  def index
    @posts = Post.all
    @recent_posts = Post.order(created_at: :desc).limit(6)
    @hot_posts = Post.order(participates_count: :desc).limit(6)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @replies = Reply.all
    @reply = Reply.new
  end

  def edit
    unless current_user == @post.user
      flash[:alert] = "Not allow!"
      redirect_to root_path
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def participate
    @post.participates.create!(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def unparticipate
    participates = Participate.where(post: @post, user: current_user)
    participates.destroy_all
    redirect_back(fallback_location: root_path)
  end

  def search
    @key_word = params["KeyWord"]
    if @key_word
      @posts = Post.where("title LIKE ?", "%#{@key_word}%")
    else
      @posts = []
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :photo, :url, :description, :delivery, :price, :goal, :due_time, :status)
  end

end
