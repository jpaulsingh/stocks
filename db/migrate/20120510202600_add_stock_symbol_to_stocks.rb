class AddStockSymbolToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :stock_symbol, :string
  end
end
