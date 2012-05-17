class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :stock_name

      t.timestamps
    end
  end
end
