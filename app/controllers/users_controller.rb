class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def set_locale
    super
  end

  def change_locale
    set_locale if I18n.available_locales.include?(params[:locale].to_s.strip.to_sym)
    redirect_to root_path
  end
end
