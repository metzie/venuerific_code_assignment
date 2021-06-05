module Front
  class HomeController < BaseController

    def index
      @posts = Post.includes(:author).published.recent.limit(5)
      @older_than = @posts.last.try(:published_at)
      if Post.published.where('posts.published_at < ?', @older_than).count == 0
        @older_than = nil
      end
    end
  end
end
