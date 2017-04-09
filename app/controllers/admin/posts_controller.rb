class Admin::PostsController < AdminController
  before_action :set_admin_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Admin::Post.all
  end

  def show
  end

  def new
    @post = Admin::Post.new
  end

  def edit
  end

  def create
    @post = Admin::Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to edit_admin_post_url(@post) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to edit_admin_post_url(@post), notice: t('.successfully_updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @post.destroy
        format.html { redirect_to admin_posts_url, notice: t('.successfully_destroyed') }
      else
        format.html { redirect_to admin_posts_url, notice: t('.error_occured') }
      end
    end
  end

  private
  def set_admin_post
    @post = Admin::Post.find(params[:id])
  end

  def post_params
    params.require(:admin_post).permit(
        :title,
        :content,
        :category_id,
    )
  end
end
