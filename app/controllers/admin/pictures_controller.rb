class Admin::PicturesController < AdminController
  before_action :set_admin_picture, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def index
    @pictures = Admin::Picture.order('created_at')
  end

  def show
  end

  def new
  end

  def edit

  end

  def create
    @picture = Admin::Picture.new(picture_params)
    respond_to do |format|
      if @picture.save
        format.html { redirect_to admin_pictures_url, notice: t('.successfully_created') }
      else
        format.html { render :index }
      end
    end
  end

  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to admin_pictures_url, notice: t('.successfully_updated') }
      else
        format.html { render :index }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @picture.destroy
        format.html { redirect_to admin_pictures_url, notice: t('.successfully_destroyed') }
      end
    end
  end

  private
    def set_admin_picture
      @picture = Admin::Picture.find(params[:id])
    end

    def picture_params
      params.require(:admin_picture).permit(
          :file,
          :title,
          :alt
      )
    end
end