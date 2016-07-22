class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def change_locale
    l = params[:locale].to_s.strip.to_sym
    super.set_locale if I18n.available_locales.include?(1)
    redirect_to root_path
  end
end
