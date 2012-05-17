class Stock < ActiveRecord::Base

  attr_accessible :stock_name, :stock_symbol, :dividend, :ex_date, :dividend_per_share, :last_price, :collected_at

  validates :stock_symbol, :presence => true 
  validates :stock_symbol,  :length => { :maximum => 4 }
  validates :stock_symbol, :stock_name,   :uniqueness => true
  has_many  :users, :through => :userlists
  has_many :userlists
end
