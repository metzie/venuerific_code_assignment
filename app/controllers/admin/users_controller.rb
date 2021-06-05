module Admin
  class UsersController < BaseController
    load_and_authorize_resource

    before_action :find_user, except: %i[index new create]

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(create_params)

      if @user.save
        flash[:notice] = 'User has been created'
        redirect_to admin_users_path
      else
        flash[:error] = @user.errors.full_messages.first
        render :new
      end
    end

    def show; end

    def edit; end

    def update
      # blank password
      if update_params[:password].blank?
        update_params.delete("password")
        update_params.delete("password_confirmation")
      end

      if @user.update(update_params)
        flash[:notice] = 'User has been updated'
        redirect_to admin_user_path(@user)
      else
        flash[:error] = @user.errors.full_messages.first
        render :edit
      end
    end

    def destroy
      if @user.destroy
        flash[:notice] = 'User has been deleted'
      else
        flash[:error] = @user.errors.full_messages.first
      end

      redirect_to admin_users_path
    end

    private

    def create_params
      params.require(:user).permit(*User.permitted_attributes+[:email, :password, :password_confirmation])
    end

    def update_params
      params.require(:user).permit(*User.permitted_attributes+[:email])
    end

    def find_user
      @user = User.find(params[:id])
    end
  end
end
