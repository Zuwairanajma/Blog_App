class PostsController < ApplicationController
  load_and_authorize_resource except:
  %i[index show]

  def index
    @posts = Post.includes(:author).where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    # @post = Post.includes(:author).find_by(author_id: params[:user_id], id: params[:id])
    @post = Post.includes(:author).find(params[:id])

    if @post
      @user = @post.author
      @comments = @post.comments
      # @comments = Post.find(@post.id).comments

    else
      flash[:alert] = 'Post not found'
      redirect_to user_posts_path(params[:user_id])
    end
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post created successfully!'
    else
      puts @user
      puts @post.errors.full_messages
      flash.now[:errors] = 'Invalid post!'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.likes.destroy_all
    @post.comments.destroy_all
    @post.destroy
    redirect_to user_posts_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :likes_counter, :comments_counter)
  end
end
