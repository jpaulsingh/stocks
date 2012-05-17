class CreateUserlists < ActiveRecord::Migration
  def change
    create_table :userlists do |t|
      t.integer :user_id
      t.integer :stock_id

      t.timestamps
    end
  end
end
