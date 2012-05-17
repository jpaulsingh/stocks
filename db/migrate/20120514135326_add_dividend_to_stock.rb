class AddDividendToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :dividend, :decimal
  end
end
