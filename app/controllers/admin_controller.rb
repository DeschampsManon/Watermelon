class AdminController < ApplicationController
  before_action :authenticate_user!
  layout 'admin_panel'
end