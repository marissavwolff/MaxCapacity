class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :password, :password_confirmation, :company, :title)
end
