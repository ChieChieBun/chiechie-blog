class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        session[:role] = user.role
        redirect_to root_path
      else
        flash.now[:alert] = "Invalid username or password."
        render :new, status: :unprocessable_entity
      end
    else
    flash.now[:alert] = "Invalid username or password."
    render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
