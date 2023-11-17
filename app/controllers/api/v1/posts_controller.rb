class Api::V1::PostsController < ApplicationController
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session
  protect_from_forgery with: :exception, except: [:create]

  def index
    @posts = Post.includes(:author).where(author_id: params[:user_id])
    @user = User.find(params[:user_id])

    if @posts
      render json: { status: 'Success', message: 'Bravo!', data: @posts }, status: :ok
    else
      render json: { status: 'Error', message: 'OOPSY Daisy!', errors: @posts.errors }, status: :bad_request
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :comments_counter, :likes_counter)
  end

  skip_before_action :verify_authenticity_token, only: [:create]
end
