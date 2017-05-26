class Admin::MenusController < AdminController
  before_action :set_admin_menu, only: [:show, :edit, :update, :destroy]
  before_action :set_admin_menu_elements, only: [:new, :edit]

  def index
    @menus = Admin::Menu.all
  end

  def show
  end

  def new
    @menu = Admin::Menu.new
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

  def append_links
    binding.pry
    @item_array = JSON.parse(params[:item_array])
  end

  private
    def set_admin_menu
      @menu = Admin::Menu.find(params[:id])
    end

    def set_admin_menu_elements
      @pages = Admin::Page.all
      @posts = Admin::Post.all
      @categories = Admin::Category.all
    end

    def menu_params
      params.require(:admin_menu).permit(
          :name,
          :active
      )
    end
end