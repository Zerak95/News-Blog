class CommentsController < ApplicationController

  def create
    if logged_in?

      @user = current_user
      @post = Post.find(params[:id])

      @comment = @user.comments.build( params.require(:comment).permit(:content),
                                        post_id: @post.id, user_id: @user.id)

      if @comment.save
        flash[:success] = "A new comment has been created"
        redirect_to @post
      else
        flash[:danger] = "The comment has not been created"
        redirect_to @post
      end
    else
        redirect_to login_path
    end
  end
end
