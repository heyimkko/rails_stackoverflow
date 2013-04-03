class SessionsController < ApplicationController

  def new 
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email].downcase)
    if @user && @user.authenticate(params[:user][:password])
      login(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
