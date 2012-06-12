class Userlist < ActiveRecord::Base
   attr_accessible :stock_id, :user_id
   belongs_to :user
   belongs_to :stock
   validates :user_id, :presence => true
   validates :stock_id, :presence => true
end
