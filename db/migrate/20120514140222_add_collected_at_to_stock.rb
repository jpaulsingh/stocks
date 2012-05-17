class AddCollectedAtToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :collected_at, :string
  end
end
