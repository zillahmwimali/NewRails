class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:username] == "dhh" && params[:password] == "secret"
      session[:authenticated] = true
      redirect_to articles_path
    else
      flash.now[:alert] = "Invalid credentials"
      render :new
    end
  end

  def destroy
      session[:authenticated] = false
    redirect_to login_path, notice: "Logged out!"
  end
end
  
