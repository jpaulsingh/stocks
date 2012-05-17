class AddExDateToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :ex_date, :date
  end
end
