class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorized?, if: :current_user
  layout 'admin_panel'

  private
    def authorized?
      if !current_user.has_role? :admin
        redirect_to(root_url)
      end
    end
end