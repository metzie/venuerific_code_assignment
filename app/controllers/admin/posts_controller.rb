module Admin
  class PostsController < BaseController
    load_and_authorize_resource

    before_action :find_post, except: %i[index new create]

    def index
      @posts = include_author
    end

    def new
      @post = current_user.posts.new
    end

    def create
      @post = current_user.posts.new(post_params)

      if @post.save
        flash[:notice] = 'Post has been created'
        redirect_to admin_posts_path
      else
        flash[:error] = @post.errors.full_messages.first
        render :new
      end
    end

    def show; end

    def edit; end

    def update
      if @post.update(post_params)
        flash[:notice] = 'Post has been updated'
        redirect_to admin_post_path(@post)
      else
        flash[:error] = @post.errors.full_messages.first
        render :edit
      end
    end

    def destroy
      if @post.destroy
        flash[:notice] = 'Post has been deleted'
      else
        flash[:error] = @post.errors.full_messages.first
      end

      redirect_to admin_posts_path
    end

    private

    def include_author
      collection = if current_user.admin?
        Post.includes(:author)
      else
        current_user.posts
      end

      collection
    end

    def post_params
      params.require(:post).permit(*Post.permitted_attributes)
    end

    def find_post
      @post = include_author.friendly.find(params[:id])
    end
  end
end
