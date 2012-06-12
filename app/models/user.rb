class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin
  validates_confirmation_of :password, :on => :create, :message => "should match confirmation"
  has_many :stocks, :through => :userlists
  has_many :userlists
  
end
