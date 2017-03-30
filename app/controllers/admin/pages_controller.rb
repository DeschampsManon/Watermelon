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
        format.html { redirect_to ':edit', :flash => { :success => t(".successfully_created") } }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to 'edit', notice: 'Lp template was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to admin_pages_url, notice: 'Lp template was successfully destroyed.' }
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
