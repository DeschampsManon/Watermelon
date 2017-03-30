class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.has_role? :admin
      admin_url
    else
      root_path
    end
  end
end
