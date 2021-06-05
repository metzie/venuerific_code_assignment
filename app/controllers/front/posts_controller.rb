module Front
  class PostsController < BaseController

    def index
      previous_older_than = Time.zone.parse(params[:older_than]) rescue nil
      previous_newer_than = Time.zone.parse(params[:newer_than]) rescue nil

      @posts = Post.includes(:author).published.recent.limit(10)
      if previous_older_than
        @posts = @posts.where('posts.published_at < ?', previous_older_than)
      elsif previous_newer_than
        @posts = @posts.where('posts.published_at > ?', previous_newer_than)
      end

      @newer_than = @posts.first.try(:published_at)
      @older_than = @posts.last.try(:published_at)

      if Post.published.where('posts.published_at < ?', @older_than).count == 0
        @older_than = nil
      end

      if Post.published.where('posts.published_at > ?', @newer_than).count == 0
        @newer_than = nil
      end
    end

    def show
      @post = Post.friendly.find(params[:id])
    end
  end
end
