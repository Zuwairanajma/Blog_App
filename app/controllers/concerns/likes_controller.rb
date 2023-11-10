class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @like = Like.new(user_id: @user.id, post_id: @post.id)
    return unless @like.save

    redirect_to user_post_path(@user.id, @post)
  end
end
# LikesController
# class LikesController < ApplicationController
#   def create
#     @post = Post.find(params[:post_id])
#     @like = current_user.likes.new(post: @post)

#     if @like.save
#       flash[:notice] = 'Post liked!'
#     else
#       flash[:alert] = 'Unable to like post!'
#     end

#     redirect_to user_post_path(current_user.id, @post)
#   end
# end
