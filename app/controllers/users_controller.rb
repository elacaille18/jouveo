class UsersController < ApplicationController
  def profile
    @user = current_user
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def new_client
    @client = User.new(client_params)
    # @client.newbee = true à modifier quand on fera les mails
    generated_password = Devise.friendly_token.first(8)
    @client.password =  generated_password
    authorize @client
    if @client.save
      UserMailer.welcome(@client, generated_password).deliver_now
      respond_to do |format|
        format.html { redirect_to new_mission_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to new_mission_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end

  private

  def client_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
