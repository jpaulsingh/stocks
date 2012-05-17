class StocksController < ApplicationController
#  before_filter :check_admin, :only => [:new, :create]

#  def check_admin
 #   if current_user && current_user.admin?
  #    return true 
   # else
    #  redirect_to new_user_session_path
    #end
 # end

  def index
    @stocks = Stock.all
  end 

  def show
    @stock = Stock.find(params[:id])
  end

  def new
    @stock = Stock.new 
  end

  def create
  quote_attrs = YahooFinance::get_standard_quotes(params["stock"]["stock_symbol"])
  quote = quote_attrs.first[1]
  attrs = {
      :stock_symbol => quote.symbol,  
      :stock_name => quote.name,  
      :dividend => quote.bid,  
      :ex_date =>  quote.ask,
      :dividend_per_share => quote.open,
      :last_price => quote.lastTrade,
      :collected_at => quote.time}

  @stock = Stock.new(attrs)
  @stock.save
    if @stock.save 
      flash[:notice] = "Sucess"
      redirect_to stocks_path    #index page 
    else
      flash[:notice] = "Failure" 
      render 'new'
    end
  end
  
  
  def update_stocks
    #quote_type = YahooFinance::StandardQuote
    current_stocks = Stock.all
    quote_symbols = []
    current_stocks.each do |stock|
      quote_symbols.push(stock.stock_symbol)
    end
    
    #quotes =  YahooFinance::get_quotes( quote_type, quote_symbols ) do |qt| 
    quotes = YahooFinance::get_standard_quotes( quote_symbols.join(","))
    @stocks = []
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
        @stocks.push(stock)
     end
     redirect_to '/'
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy
   flash[:notice] = "Stock successfully removed" 
    redirect_to stocks_path 
  end
end
