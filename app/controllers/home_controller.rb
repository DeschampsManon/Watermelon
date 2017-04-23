class HomeController < ApplicationController
  before_action :set_page, only: [:show]

  def index
    @menu = Admin::Menu.where(active: true).first
    # @pages = Admin::Page.all
    # @page = @pages.where(is_index: true).first
  end

  def show

  end

  private
  def set_page
    # @page = Admin::Page.find(params[:id])
  end

end
