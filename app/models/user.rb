class User < ActiveRecord::Base
  has_many :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :trackable,
         :validatable
  validates :email, :presence => true
  validates :username, :presence => true




end
