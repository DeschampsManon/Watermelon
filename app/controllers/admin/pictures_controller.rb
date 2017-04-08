class Admin::PicturesController < AdminController
  def index
    @pictures = Admin::Picture.order('created_at')
    @picture = Admin::Picture.new
  end

  def new
    @picture = Admin::Picture.new
  end

  def create
    @picture = Admin::Picture.new(picture_params)
    respond_to do |format|
      if @picture.save
        format.html { redirect_to admin_pictures_url }
      else
        format.html { render :index }
      end
    end
  end

  private
    def picture_params
      params.require(:admin_picture).permit(:file, :title)
    end
end