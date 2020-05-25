module PostsHelper

    def post_topics
        @topics = [["====Select====", nil]]
        @topics_all = Topic.all
        @topics_all.each do|user|
            @topics.push([user.name, user.id])
        end
        return @topics
    end
end
