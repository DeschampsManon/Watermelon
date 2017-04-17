class Admin::MenusController < AdminController
  before_action :set_admin_menu, only: [:show, :edit, :update, :destroy]

  def index
    @menus = Admin::Menu.all
  end

  def show
  end

  def new
    @menu = Admin::Menu.new
    @pages = Admin::Page.all
    @posts = Admin::Post.all
    @categories = Admin::Category.all
  end

  def edit
  end

  def create
    @menu = Admin::Menu.new(menu_params)
    respond_to do |format|
      if @menu.save
        format.html { redirect_to admin_menus_url, notice: t('.successfully_created') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to admin_menus_url, notice: t('.successfully_updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @menu.destroy
        format.html { redirect_to admin_menus_url, notice: t('.successfully_destroyed') }
      else
        format.html { redirect_to admin_menus_url, notice: t('.error_occured') }
      end
    end
  end

  def toggle_suspend_menu

  end

  private
    def set_admin_menu
      @menu = Admin::Menu.find(params[:id])
    end

    def menu_params
      params.require(:admin_menu).permit(
          :name,
          :active
      )
    end
end