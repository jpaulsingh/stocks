class UsersController < ApplicationController

  before_filter :admin, :only => [:new, :create]
  
  def admin
    if current_user && current_user.admin?
      return true
    else
      redirect_to user_session_path
    end
  end

  def index
  redirect_to users_path
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(params[:user])
       if @user.save
          flash[:success] = "User Creaion successful"
          redirect_to root_url
       else
          render  'new'
       end
  end

  def show
    @user = User.find(params[:id])           
  end

end
