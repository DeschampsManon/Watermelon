class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_filter :set_current_user, if: :current_user

  def after_sign_in_path_for(resource)
    if current_user.has_role? :admin
      admin_url
    else
      root_path
    end
  end

  def set_current_user
    User.current_user = current_user
  end

  def set_locale
    if current_user.present? && current_user.locale?
      I18n.locale = current_user.locale
    else
      I18n.locale = extract_locale_from_accept_language_header || I18n.default_locale
    end
  end

  private
    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end

end






