class PostsController < ApplicationController

    def recent
        # beginning_of_month = Date.today.beginning_of_month
        # end_of_month = beginning_of_month.end_of_month
        # @posts = Post.where(created_at: beginning_of_month..end_of_month)
    end

    def new
      @post = Post.new
    end
end
