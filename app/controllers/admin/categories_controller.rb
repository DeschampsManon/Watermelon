class Admin::CategoriesController < AdminController
  before_action :set_admin_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Admin::Category.all
  end

  def show
  end

  def new
    @category = Admin::Category.new
  end

  def edit
  end

  def create
    @category = Admin::Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_url, notice: t('.successfully_created') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_categories_url, notice: t('.successfully_updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @category.destroy
        format.html { redirect_to admin_categories_url, notice: t('.successfully_destroyed') }
      else
        format.html { redirect_to admin_categories_url, notice: t('.error_occured') }
      end
    end
  end

  private
  def set_admin_category
    @category = Admin::Category.find(params[:id])
  end

  def category_params
    params.require(:admin_category).permit(
        :name,
        :description
    )
  end
end
