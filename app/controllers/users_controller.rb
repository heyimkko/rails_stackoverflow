class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      login(@user)
      redirect_to root_path
    else
      render :new
    end
    
  end

  def show
  end

end
