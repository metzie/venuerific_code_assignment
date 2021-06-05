module Front
  class HomeController < BaseController

    def index
      @posts = Post.includes(:author).published.limit(5)
      @older_than = 1
      if Post.published.offset(5 * @older_than).count == 0
        @older_than = nil
      end
    end
  end
end
