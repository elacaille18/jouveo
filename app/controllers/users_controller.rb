class UsersController < ApplicationController
  def profile
    @user = current_user
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end
end
