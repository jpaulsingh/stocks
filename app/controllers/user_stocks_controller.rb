class UserstocksController < ApplicationController
  def index
  @userstocks = current_user.stocks
  end

def show
    @userstocks = Stock.find(params[:id])
end  

def new
   @userstocks = Stock.new 
end

def watch_stock 
     stock = Stock.find(params[:stock_id])

      @userstocks = Userlist.new(:user_id => current_user.id, :stock_id => stock.id)
   
         if @userstocks.save 
            flash[:notice] = "Sucess"
            redirect_to stocks_path    #index page 
        else
            flash[:notice] = "Failure" 
            render 'new'
         end
 end

end
