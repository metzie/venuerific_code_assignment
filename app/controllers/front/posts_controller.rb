module Front
  class PostsController < BaseController

    def index
      page = params[:page].to_i rescue 0

      @posts = Post.includes(:author).published.limit(5).offset(5 * page)

      @newer_than = page.zero? ? nil : page - 1
      @older_than = page + 1
      if Post.published.offset(5 * @older_than).count == 0
        @older_than = nil
      end
    end

    def show
      @post = Post.friendly.find(params[:id])
    end
  end
end
