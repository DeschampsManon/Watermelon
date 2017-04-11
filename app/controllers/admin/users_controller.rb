class Admin::UsersController < AdminController
  before_action :set_admin_user, only: [:show, :edit, :update, :update_password, :my_password, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      generated_password = Devise.friendly_token.first(8)
      @user.password = generated_password
      @user.add_role params[:user][:roles]
      if @user.save
        UserMailer.welcome(@user, generated_password).deliver
        format.html { redirect_to admin_users_url, notice: t('.successfully_created') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      @user.roles = []
      @user.add_role params[:user][:roles]
      if @user.update(user_params)
        format.html { redirect_to admin_users_url, notice: t('.successfully_updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        format.html { redirect_to admin_users_url, notice: t('.successfully_destroyed') }
      end
    end
  end

  def my_password

  end

  def update_password
    if @user.update_with_password(user_params_password)
      sign_in @user, :bypass => true
      format.html { redirect_to admin_url, notice: t('.successfully_updated') }
    else
      redirect_to my_password_admin_user_url
      flash[:alert] = t('.fail_change_password')
    end
  end

  def update_locale
    locale = params[:id]
    current_user.locale = locale
    current_user.save!
    redirect_to :back
  end

  private
    def set_admin_user
      @user = User.find(params[:id])
    end

    def user_params_password
      params.require(:user).permit(:current_password, :password, :password_confirmation, :locale)
    end

    def user_params
      params.require(:user).permit(
          :email,
          :first_name,
          :last_name,
          :avatar,
          :phone,
          :address,
          :city,
          :zip_code,
          #roles: []
      )
    end
end
