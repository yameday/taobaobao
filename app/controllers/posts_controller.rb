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
    UserMailer.notify_post_create(current_user, @post).deliver_now!
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
    @post.update(post_params)
    if @post.status == "已結團"
      @post.participated_user.each do |participate|
        UserMailer.notify_ending_create(participate, @post).deliver_now!
      end 
      flash[:notice] = "Great!"
      redirect_to post_path
    else
      redirect_to posts_path
    end
  end

  def participate
    @post.participates.create!(user_id: current_user.id)
    UserMailer.notify_participate_create(current_user, @post).deliver_now!
    redirect_back(fallback_location: root_path)
  end

  def unparticipate
    participates = Participate.where(post: @post, user_id: current_user.id)
    participates.destroy_all
    UserMailer.notify_unparticipate_create(current_user, @post).deliver_now!
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

