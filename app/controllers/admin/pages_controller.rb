class Admin::PagesController < AdminController
  before_action :set_admin_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Admin::Page.all
  end

  def show
  end

  def new
    @page = Admin::Page.new
  end

  def edit
  end

  def create
    @page = Admin::Page.new(page_params)
    respond_to do |format|
      if @page.save
        format.html { redirect_to edit_admin_page_url(@page), notice: t('.successfully_created') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to admin_page_url, notice: t('.successfully_updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @page.destroy
        format.html { redirect_to admin_pages_url, notice: t('.successfully_destroyed') }
      else
        format.html { redirect_to admin_pages_url, notice: t('.error_occured') }
      end
    end
  end

  private
    def set_admin_page
      @page = Admin::Page.find(params[:id])
    end

    def page_params
      params.require(:admin_page).permit(
          :name,
          :meta_description,
          :page_title
      )
    end
end
