class LikesController < ApplicationController

    # def index
    #     @likes = Like.all
    # end

    # def new
    # @like = Like.new
    # end

    # def create
    #     @user = current_user
    #     @like = Like.new(like_params)
    #     @post = Post.find(params[:post_id])
    #     @comment = Comment.find(params[:post_id])
    #     @like.post = @post
    #     @like.user = current_user
    #     @like.comment = @comment
    #     if @like.save
    #     redirect_to user_post_path(@user), notice: 'Comment created!'   
    #     else
    #         flash.now[:errors] = 'Invalid like!'
    #         render :new
    #     end
    #     end

    #     private
    #     def like_params
    #         params.require(:like).permit(:text)
    # end
end
