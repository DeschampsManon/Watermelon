class Admin::UsersController < AdminController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def my_profile
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    @user.add_role params[:user][:role]
    generated_password = Devise.friendly_token.first(8)
    @user.password = generated_password
    #UserMailer.welcome(@user, generated_password).deliver
    respond_to do |format|
      if @user.save!
        format.html { redirect_to edit_admin_user_url(@user), notice: t('.successfully_created') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
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
      else
        format.html { redirect_to admin_users_url, notice: t('.error_occured') }
      end
    end
  end

  private
    def set_admin_user
      @user = User.find(params[:id])
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
          :role
      )
    end
end
