class Admin::PagesController < AdminController
  def index
    @pages = Admin::Page.all
  end
end