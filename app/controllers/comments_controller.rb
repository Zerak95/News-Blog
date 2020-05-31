class CommentsController < ApplicationController

  def create
    if logged_in?

      @user = current_user
      @post_id = params.require(:comment).permit(:post_id)

      @post = Post.find(@post_id[:post_id])

      @comment = @user.comments.build( params.require(:comment).permit(:content,:post_id))

      if @comment.save
        flash[:success] = "A new comment has been created"
        redirect_to @post
      else
        flash[:danger] = "The comment has not been created"
        render "/posts/show"
      end
    else
        redirect_to login_path
    end
  end
end
