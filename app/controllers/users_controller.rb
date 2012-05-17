class UsersController < ApplicationController
  def index
  redirect_to users_path
  end

  def new
      @user = User.new()
    end

   def admin
     @stocks = Stock.all
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
