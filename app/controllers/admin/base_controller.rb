module Admin
  class BaseController < ApplicationController
    layout 'admin'

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to admin_root_url, error: exception.message
    end
  end
end
