module PostsHelper

    def post_topics
        @topics = [["====Select====", no_post_topic]]
        @topics_all = Topic.all
        @topics_all.each do|topic|
          if topic.name != "News"  
            @topics.push([topic.name, topic.id])
          end
        end
        return @topics
    end

    def no_post_topic
        @topic = Topic.where(name:"News").first.id
    end

    def top_viewed_posts
        @post = Post.order('view_count').limit(5)
      end
end
