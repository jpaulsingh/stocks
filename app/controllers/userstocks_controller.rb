class UserstocksController < ApplicationController

  def index
    @userstocks = current_user.stocks
    @userstocks = current_user.stocks.paginate :page => params[:page], :per_page => 15 
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
        redirect_to stocks_path     
      else
        flash[:notice] = "Failure" 
        render 'new'
      end
  end

  def update_my_stocks
    @userstocks = current_user.stocks
    quote_symbols = []
    @userstocks.each do |stock| 
    quote_symbols.push(stock.stock_symbol)
    end
    quotes = YahooFinance::get_standard_quotes( quote_symbols.join(","))
    @userstocks = []
    quotes.each do |qt|
      attr = {
        :stock_symbol => qt[1].symbol,  
        :dividend => qt[1].bid,  
        :ex_date =>  qt[1].ask,
        :dividend_per_share => qt[1].open,
        :last_price => qt[1].lastTrade,
        :collected_at => qt[1].time}
    stock = Stock.find_by_stock_symbol(qt[1].symbol)
    stock.update_attributes(attr)
    @userstocks.push(stock)
    flash[:notice] = " Your all stocks updated"
    end
   redirect_to userstocks_path
  
  end



  def delete_stock
    if current_user
      user = current_user
      stock = Stock.find(params[:stock])
      user.stocks.delete(stock)
      flash[:notice] = "Your stock removed"
      redirect_to userstocks_path 
    else
      flash[:notice] = "Stock still around"
      redirect_to :back 
    end
  end


end
