class AddDividendPerShareToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :dividend_per_share, :decimal
  end
end
