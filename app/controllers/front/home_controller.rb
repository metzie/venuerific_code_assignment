module Front
  class HomeController < BaseController

    def index
      @posts = Post.includes(:author).published.limit(5)
    end
  end
end
