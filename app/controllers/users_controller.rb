class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      session
      redirect_to '/'
    end
  end

  def edit
  end

  def update
  end

  def show
    redirect_to controller: 'application', action: 'home' unless logged_in?
    @user = User.find_by(:id => params[:id])
  end

  private
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :tickets, :admin, :password)
    end
end