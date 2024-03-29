class PostsController < ApplicationController

    def show
        @post = Post.find(params[:id])
        @post.view_count += 1
        if @post.topic != "News"
            @topic = @post.topic
            @topic.view_count += 1
            @topic.save
        end
        @post.save
        if logged_in?
            @comment = Comment.new
        end
    end


    def index
        @posts = Post.all
    end

    def new
      if logged_in?
        @post = Post.new
      else
        redirect_to login_path
      end
    end

    def create
        if logged_in?

            @user = current_user
            @topic_id = params.require(:post).permit(:topic_id)
            if @topic_id.nil?
                @post = @user.posts.build( params.require(:post).permit(:content,
                                                                        :title))
            else
                @post = @user.posts.build( params.require(:post).permit(:topic_id,
                                                            :content, :title))
            end

            if @post.save
                flash[:success] = "A new post has been created"
                redirect_to root_url
            else
                render 'new'
            end
        else
            redirect_to login_path
        end
    end
end
