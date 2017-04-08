class Admin::PicturesController < AdminController
  def index
    @pictures = Admin::Picture.order('created_at')
  end

  def new
    @picture = Admin::Picture.new
  end

  def create
    @picture = Admin::Picture.new(picture_params)
    if @picture.save
      flash[:success] = "The photo was added!"
      #redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def picture_params
      params.require(:admin_picture).permit(:file, :title)
    end
end