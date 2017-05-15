class Api::SessionsController < ApplicationController
  def create
    p "FIND ME"
    p user_params
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    p @user
    if @user
      login(@user)
      render "api/users/show"
    else
      render json: ["Invalid Params"], status: 401
    end
  end

  def destroy
    @user = current_user
    logout
    render "api/users/show"
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
